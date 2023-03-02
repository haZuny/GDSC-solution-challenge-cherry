import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class HomePageEmp extends StatefulWidget {
  @override
  State<HomePageEmp> createState() => _HomePageEmp();
}

class _HomePageEmp extends State<HomePageEmp> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarEmp(),
          drawer: DrawerEmp(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// 로고 이미지
                Image.asset(
                  'assets/img/logo.png',
                  width: getFullScrennSizePercent(
                      context, homePage_logoWidth, true),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, homePage_spacePerTitle, false),
                ),

                /// 타이틀
                Container(
                  width: getFullScrennSizePercent(
                      context, homePage_logoWidth, true),
                  child: Text(
                    "Check your safety.",
                    style: TextStyle(fontSize: allPage_subTitleFontSize),
                  ),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, homePage_spacePerTitle, false),
                ),

                // 버튼 열
                Container(
                  width: getFullScrennSizePercent(
                      context, homePage_logoWidth, true),
                  child: Row(
                    children: [
                      /// 헬멧 체크 버튼
                      ElevatedButton(
                        onPressed: () {},
                        // 내부 컴포넌트
                        child: Text(
                          "Helmet wear\ninspection",
                          style: TextStyle(color: Color(themaColor_whiteBlack)),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                            // 크기 설정
                            minimumSize: Size(
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnWidth, true),
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnHeight, false)),
                            maximumSize: Size(
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnWidth, true),
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnHeight, false)),
                            // 모양 및 테두리 설정
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(allPage_btnRadius),
                              side: BorderSide(
                                  color: Color(themaColor_black),
                                  width: allPage_btnBorderWidth),
                            ),

                            // 배경 색상 설정
                            backgroundColor: Color(themaColor_white),
                            // 그림자 투명도
                            elevation: 10),
                      ),

                      /// 간격
                      Container(
                        width: getFullScrennSizePercent(
                            context, homePage_spacePerBtn, true),
                      ),

                      /// 현장 체크 현황 확인
                      ElevatedButton(
                        onPressed: () {
                        },
                        // 내부 컴포넌트
                        child: Text(
                          "Today's site\nCheck List",
                          style: TextStyle(color: Color(themaColor_whiteBlack)),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                            // 크기 설정
                            minimumSize: Size(
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnWidth, true),
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnHeight, false)),
                            maximumSize: Size(
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnWidth, true),
                                getFullScrennSizePercent(
                                    context, homePage_smallBtnHeight, false)),
                            // 모양 및 테두리 설정
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(allPage_btnRadius),
                              side: BorderSide(
                                  color: Color(themaColor_black),
                                  width: allPage_btnBorderWidth),
                            ),

                            // 배경 색상 설정
                            backgroundColor: Color(themaColor_white),
                            // 그림자 투명도
                            elevation: 10),
                      ),
                    ],
                  ),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, homePage_spacePerBtn, true),
                ),

                /// 긴급 버튼
                ElevatedButton(
                  onPressed: () {},
                  // 내부 컴포넌트
                  child: Text(
                    "Emergency",
                    style: TextStyle(
                        color: Color(themaColor_whiteBlack),
                        fontSize: homePage_emergencyBtnFontSize),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      // 크기 설정
                      minimumSize: Size(
                          getFullScrennSizePercent(
                              context, homePage_bigBtnWidth, true),
                          getFullScrennSizePercent(
                              context, homePage_bigBtnHeight, false)),
                      maximumSize: Size(
                          getFullScrennSizePercent(
                              context, homePage_bigBtnWidth, true),
                          getFullScrennSizePercent(
                              context, homePage_bigBtnHeight, false)),
                      // 모양 및 테두리 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(allPage_btnRadius),
                        side: BorderSide(
                            color: Color(themaColor_black),
                            width: allPage_btnBorderWidth),
                      ),

                      // 배경 색상 설정
                      backgroundColor: Color(themaColor_white),
                      // 그림자 투명도
                      elevation: 10),
                ),
              ],
            ),
          ),
        ),
      );
}
