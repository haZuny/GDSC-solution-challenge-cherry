import 'dart:io';

import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Classifier.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HelmetCheckPage extends StatefulWidget {
  @override
  State<HelmetCheckPage> createState() => _HelmetCheckPage();
}

class _HelmetCheckPage extends State<HelmetCheckPage> {
  // Image Picker
  final ImagePicker _picker = ImagePicker();

  // 이미지
  Image? helmetImage;

  // 체크 여부
  bool stateChecked = false;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getMyImage();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerEmp(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 이미지 or Progress Indicator
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    height: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    decoration: BoxDecoration(
                        color: Color(themaColor_white),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: allPage_shadowBlurRadius,
                              offset: Offset(
                                  allPage_shadowOffSet, allPage_shadowOffSet),
                              color: Color(themaColor_whiteBlack))
                        ]),
                    child: helmetImage ??
                        Padding(
                            padding: EdgeInsets.all(getFullScrennSizePercent(context, helmetCheckPage_progressIndicatorPadding)),
                            child: CircularProgressIndicator()),
                  ),

                  /// check 여부
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        stateChecked ? "Checked":"Unchecked",
                        style: TextStyle(
                            fontSize: putCheckCodePage_checkBtnFontSize,
                            fontWeight: FontWeight.w500,
                            color: stateChecked?Color(allPage_btnFontColor):Color(allPage_btnSubFontColor)),
                      ),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, helmetCheckPage_spacePerNextBtn),
                  ),

                  /// next 버튼
                  TextButton(
                      onPressed: () {
                        if(stateChecked){

                        }
                        else{

                        }
                      },
                      child: Text(
                        stateChecked?"Next":"Re-try",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      ))
                ],
              ),
            ),
          ),
        ),
      );

  /// 사진 촬영 메소드
  Future getMyImage() async {
    PickedFile? pickedImage =
        await _picker.getImage(source: ImageSource.gallery);
    // 이미지 보여주기
    setState(() {
      helmetImage = Image.file(File(pickedImage!.path));
      stateChecked = true;
    });

    // ML
    Classifier classifier = Classifier(File(pickedImage!.path));
    classifier.classify();
    // return Image.file(File(pickedImage!.path));
  }
}
