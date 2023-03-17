import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/All_EmergencyPage.dart';
import 'package:cherry_app/Emp_HelmetCheckPage.dart';
import 'package:cherry_app/Manager_manageEmpPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'Manager_CheckListPage.dart';
import 'All_SiteInfoPage.dart';

class HomePageManager extends StatefulWidget {
  @override
  State<HomePageManager> createState() => _HomePageManager();
}

class _HomePageManager extends State<HomePageManager> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    Response? res;
    try {
      api_admin_getSiteInfo(global_googleUser!.email)
          .then((value) => api_site_getSiteInfo(global_siteId))
          .then((value) => print(">>> admin 현장 정보 조회 성공"));
    } catch (e) {
      print(">>> admin 현장 정보 조회 실패");
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerManager(),
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
                        context, allPage_mainComponentsWidth),
                  ),

                  /// 로고와 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, homePage_spacePerLogo),
                  ),

                  /// 타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
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
                        context, allPage_mainComponentsWidth),
                    child: Row(
                      children: [
                        /// 작업 시작 버튼
                        ElevatedButton(
                          onPressed: () {},
                          // 내부 컴포넌트
                          child: Text(
                            "Start work",
                            style:
                                TextStyle(color: Color(themaColor_whiteBlack)),
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

                        /// 현장 체크 버튼
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              Transition(
                                  child: CheckListPageManager(),
                                  transitionEffect:
                                      TransitionEffect.RIGHT_TO_LEFT),
                            );
                          },
                          // 내부 컴포넌트
                          child: Text(
                            "Today's site\nCheck List",
                            style:
                                TextStyle(color: Color(themaColor_whiteBlack)),
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
                    height:
                        getFullScrennSizePercent(context, homePage_spacePerBtn),
                  ),

                  /// 긴급 버튼
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                        Transition(
                            child: EmergencyPage(),
                            transitionEffect:
                            TransitionEffect.RIGHT_TO_LEFT),);
                    },
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
                                context, allPage_mainComponentsWidth),
                            getFullScrennSizePercent(
                                context, homePage_bigBtnHeight)),
                        maximumSize: Size(
                            getFullScrennSizePercent(
                                context, allPage_mainComponentsWidth),
                            getFullScrennSizePercent(
                                context, homePage_bigBtnHeight)),
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
                    height:
                        getFullScrennSizePercent(context, homePage_spacePerBtn),
                  ),

                  // 버튼 열
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: Row(
                      children: [
                        /// 현장 정보
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                              Transition(
                                  child: SiteInfoPageAll(),
                                  transitionEffect:
                                  TransitionEffect.RIGHT_TO_LEFT),);
                          },
                          // 내부 컴포넌트
                          child: Text(
                            "Workspace's\ninfo",
                            style:
                                TextStyle(color: Color(themaColor_whiteBlack)),
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

                        /// 직원 관리
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                              Transition(
                                  child: ManageEmpPageManager(),
                                  transitionEffect:
                                  TransitionEffect.RIGHT_TO_LEFT),);
                          },
                          // 내부 컴포넌트
                          child: Text(
                            "Manage\nemployee",
                            style:
                                TextStyle(color: Color(themaColor_whiteBlack)),
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
                    height:
                        getFullScrennSizePercent(context, homePage_spacePerBtn),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
