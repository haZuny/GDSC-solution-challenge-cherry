import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as IMG;

class Classifier {
  // 이미지
  late File imgFile;
  late TensorImage _inputImage;
  late TensorImage tensorImage;
  // tflite 인터프리터
  late Interpreter interpreter;
  // 모델
  String modelName = 'ml/modelTFLite.tflite';

  // 생성자
  Classifier(File imgFile){
    this.imgFile = imgFile;
  }

  // 사진 초기화
  Future<TensorImage> preProcess() async {
    _inputImage = TensorImage(interpreter.getInputTensor(0).type);
    _inputImage.loadImage(IMG.decodeImage(this.imgFile.readAsBytesSync())!);
    int cropSize = min(_inputImage.height, _inputImage.width);

    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
        interpreter.getInputTensor(0).shape[1], interpreter.getInputTensor(0).shape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(NormalizeOp(127.5, 127.5)).add(QuantizeOp(128.0, 1/128.0))
        .build()
        .process(_inputImage);
  }

  // 모델 불러오기
  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset(modelName);
  }

  // 분류
  Future<double> classify() async {
    await loadModel();
    tensorImage = await preProcess();
    TensorBuffer output = TensorBuffer.createFixedSize(interpreter.getOutputTensor(0).shape, interpreter.getOutputTensor(0).type);
    interpreter.run(tensorImage.buffer, output.getBuffer());
    int maxIdx = 0;
    double maxVal = 0;
    return output.getDoubleList()[0];
  }
}