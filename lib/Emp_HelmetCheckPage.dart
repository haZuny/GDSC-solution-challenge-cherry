import 'dart:io';

import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Classifier.dart';
import 'package:cherry_app/Emp_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transition/transition.dart';

import 'Manager_HomePage.dart';

class HelmetCheckPage extends StatefulWidget {
  @override
  State<HelmetCheckPage> createState() => _HelmetCheckPage();
}

class _HelmetCheckPage extends State<HelmetCheckPage> {
  // Image Picker
  final ImagePicker _picker = ImagePicker();
  PickedFile? _pickedImage;

  // 이미지
  Image? _helmetImage;

  // 체크 여부
  bool _stateChecked = false;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getMyImage().then((value) {
      // ML
      Classifier classifier = Classifier(File(_pickedImage!.path));
      classifier.classify().then((value) {
        if (value > 0.6) {
          setState(() {
            _stateChecked = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerAll(),

          /// bottom bar
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height:
                  getFullScrennSizePercent(context, bottomBar_bottomBarHeight),
            ),
            shape: CircularNotchedRectangle(),
            color: Color(themaColor_white),
            notchMargin:
                getFullScrennSizePercent(context, bottomBar_bottomBarNorch),
          ),

          /// floating btn
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
                bottom: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnMargin)),
            child: FloatingActionButton(
              child: Icon(
                Icons.home,
                size: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnSize),
              ),
              backgroundColor: Color(themaColor_yellow),
              onPressed: () {
                if (global_userRole == enum_Role.user)
                  Navigator.pushAndRemoveUntil(context,
                      Transition(child: HomePageEmp()), (_) => false);
                else
                  Navigator.pushAndRemoveUntil(context,
                      Transition(child: HomePageManager()), (_) => false);
              },
            ),
          ),

          /// floating btn location
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          /// body
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
                    child: _helmetImage ??
                        Padding(
                            padding: EdgeInsets.all(getFullScrennSizePercent(
                                context,
                                helmetCheckPage_progressIndicatorPadding)),
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
                        _stateChecked ? "Checked" : "Unchecked",
                        style: TextStyle(
                            fontSize: putCheckCodePage_checkBtnFontSize,
                            fontWeight: FontWeight.w500,
                            color: _stateChecked
                                ? Color(allPage_btnFontColor)
                                : Color(allPage_btnSubFontColor)),
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
                      onPressed: () async {
                        // 확인
                        if (_stateChecked) {
                          late Response res;
                          try {
                            res = await api_user_editHelmetCheck(true);
                            Navigator.pushAndRemoveUntil(
                                context,
                                Transition(
                                    child: HomePageEmp(),
                                    transitionEffect:
                                        TransitionEffect.LEFT_TO_RIGHT),
                                (_) => false);
                          } catch (e) {}
                        }
                        // 실패
                        else {
                          getMyImage().then((value) {
                            // ML
                            Classifier classifier =
                                Classifier(File(_pickedImage!.path));
                            classifier.classify().then((value) {
                              if (value > 0.6) {
                                setState(() {
                                  _stateChecked = true;
                                });
                              }
                            });
                          });
                        }
                      },
                      child: Text(
                        _stateChecked ? "Next" : "Re-try",
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
    _pickedImage = await _picker.getImage(source: ImageSource.camera);
    // 이미지 보여주기
    setState(() {
      _helmetImage = Image.file(File(_pickedImage!.path));
    });

    // return Image.file(File(pickedImage!.path));
  }
}
