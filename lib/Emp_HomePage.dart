import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/Emp_HelmetCheckPage.dart';
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
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 로고 이미지
                  Image.asset(
                    'assets/img/logo.png',
                    width: getFullScrennSizePercent(
                        context, homePage_logoWidth),
                  ),

                  /// 로고와 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, homePage_spacePerLogo),
                  ),

                  /// 타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, homePage_logoWidth),
                    child: Text(
                      "Check your safety.",
                      style: TextStyle(fontSize: allPage_subTitleFontSize),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, homePage_spacePerTitle),
                  ),

                  // 버튼 열
                  Container(
                    width: getFullScrennSizePercent(
                        context, homePage_logoWidth),
                    child: Row(
                      children: [
                        /// 헬멧 체크 버튼
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HelmetCheckPage()));
                          },
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
                                      context, homePage_smallBtnWidth),
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnHeight)),
                              maximumSize: Size(
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnWidth),
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnHeight)),
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
                              context, homePage_spacePerBtn),
                        ),

                        /// 현장 체크 현황 확인
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckListPageEmp()));
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
                                      context, homePage_smallBtnWidth),
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnHeight)),
                              maximumSize: Size(
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnWidth),
                                  getFullScrennSizePercent(
                                      context, homePage_smallBtnHeight)),
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
                        context, homePage_spacePerBtn),
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
                                context, homePage_bigBtnWidth),
                            getFullScrennSizePercent(
                                context, homePage_bigBtnHeight)),
                        maximumSize: Size(
                            getFullScrennSizePercent(
                                context, homePage_bigBtnWidth),
                            getFullScrennSizePercent(
                                context, homePage_bigBtnHeight)),
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
        ),
      );
}
