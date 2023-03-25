import 'dart:io';

import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Classifier.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transition/transition.dart';

import 'All_HomePage.dart';

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
      if (value) {
        // ML
        Classifier classifier = Classifier(File(_pickedImage!.path));
        classifier.classify().then((value) {
          if (value > 0.6) {
            setState(() {
              _stateChecked = true;
            });
          }
        });
      } else {
        Navigator.pushAndRemoveUntil(
            context, Transition(child: HomePageAll()), (_) => false);
      }
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
                Navigator.pushAndRemoveUntil(
                    context, Transition(child: HomePageAll()), (_) => false);
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
                  /// 위, 아래 공간
                  Container(
                    height:
                        getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),

                  /// 타이틀
                  Text(
                    "Check helmet",
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// 타이틀과 서브타이틀 사이 공간
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndSubTitme),
                  ),

                  /// 서브타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.center,
                    child: Text(
                      "C H E R R Y",
                      style: TextStyle(
                        color: Color(themaColor_white),
                        fontSize: allPage_subTitleFontSize,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(themaColor_yellow),
                        borderRadius:
                            BorderRadius.circular(allPage_subTitleLineRadius)),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, helmetCheckPage_spacePerTitle),
                  ),

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
                        ],
                        border: Border.all(
                            color: Color(themaColor_yellow),
                            width: allPage_BigSpaceWidth)),
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
                                ? Color(themaColor_blue)
                                : Color(themaColor_red)),
                      ),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, helmetCheckPage_spacePerNextBtn),
                  ),

                  /// 버튼
                  ElevatedButton(
                    onPressed: () async {
                      // 확인
                      if (_stateChecked) {
                        late Response res;
                        try {
                          res = await api_user_editHelmetCheck(true);
                          Navigator.pushAndRemoveUntil(context,
                              Transition(child: HomePageAll()), (_) => false);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("Check succeeded."));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("Check failed."));
                        }
                      }
                      // 실패
                      else {
                        getMyImage().then((value) {
                          if (value) {
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
                          }
                        });
                      }
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트
                        Text(
                          _stateChecked ? "Submit" : "Re-try",
                          style: TextStyle(
                              color: Color(themaColor_yellow),
                              fontSize: allPage_roundBtnFontSize),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        // 크기 설정
                        minimumSize: Size(
                            getFullScrennSizePercent(
                                context, allPage_roundBtnWidth),
                            getFullScrennSizePercent(
                                context, allPage_roundBtnHeight)),
                        maximumSize: Size(
                            getFullScrennSizePercent(
                                context, allPage_roundBtnWidth),
                            getFullScrennSizePercent(
                                context, allPage_roundBtnHeight)),
                        // 모양 및 테두리 설정
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(allPage_roundBtnRadius),
                          side: BorderSide(
                              color: Color(themaColor_yellow),
                              width: allPage_addBtnWidth),
                        ),

                        // 배경 색상 설정
                        backgroundColor: Color(themaColor_white),
                        // 그림자 투명도
                        elevation: 10),
                  ),

                  /// 위, 아래 공간
                  Container(
                    height:
                        getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  /// 사진 촬영 메소드
  Future getMyImage() async {
    _pickedImage = await _picker.getImage(source: ImageSource.camera);
    try {
      // 이미지 보여주기
      setState(() {
        _helmetImage = Image.file(File(_pickedImage!.path));
      });
      return true;
    } catch (e) {
      print("aaaaaaaaaaaaa");
      return false;
    }
  }
}
