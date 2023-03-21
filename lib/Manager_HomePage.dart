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
    // 현장 정보 조회
    api_admin_getSiteInfo(global_googleUser!.email)
        .then((value) => api_site_getSiteInfo(global_siteId));
    // 개인 정보 조회
    api_admin_getPrivacy(global_userId);
    // 현재 로그인된 계정 등급 설정
    global_userRole = enum_Role.manager;
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
            color: Color(themaColor_whiteYellow),
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
                    alignment: Alignment.center,
                    color: Color(themaColor_yellow),
                    child: Text(
                      "Check your safety",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: allPage_subTitleFontSize,
                      ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// 작업 시작 버튼
                        ElevatedButton(
                          onPressed: () async {
                            late Response res;
                            try {
                              res = await api_site_clearSite(global_siteId);
                            } catch (e) {}
                          },
                          // 내부 컴포넌트
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 아이콘
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(homePage_iconRound),
                                      border: Border.all(
                                          color:
                                          Color(themaColor_yellow), width: homePage_iconWeight)),
                                  child: Icon(
                                    Icons.replay,
                                    size: getFullScrennSizePercent(
                                        context, homePage_iconSize),
                                    color: Color(themaColor_yellow),
                                  )),
                              Container(height: getFullScrennSizePercent(context, homePage_spacePerIcon),),
                              // 텍스트
                              Text(
                                "Start work",
                                style: TextStyle(
                                    color: Color(themaColor_whiteBlack)),
                                textAlign: TextAlign.center,
                              ),
                            ],
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 아이콘
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(homePage_iconRound),
                                      border: Border.all(
                                          color:
                                              Color(themaColor_yellow), width: homePage_iconWeight)),
                                  child: Icon(
                                    Icons.check,
                                    size: getFullScrennSizePercent(
                                        context, homePage_iconSize),
                                    color: Color(themaColor_yellow),
                                  )),
                              // 간격
                              Container(height: getFullScrennSizePercent(context, homePage_spacePerIcon),),
                              // 텍스트
                              Text(
                                "Check list",
                                style: TextStyle(
                                    color: Color(themaColor_whiteBlack)),
                                textAlign: TextAlign.center,
                              ),
                            ],
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
                            transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                      );
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 아이콘
                        Icon(
                          Icons.medical_services_outlined,
                          size: getFullScrennSizePercent(
                              context, homePage_iconSizeBig),
                          color: Color(themaColor_yellow),
                        ),
                        // 간격
                        Container(height: getFullScrennSizePercent(context, homePage_spacePerIconBig),),
                        // 텍스트
                        Text(
                          "Emergency",
                          style: TextStyle(
                              color: Color(themaColor_whiteBlack),
                              fontSize: homePage_emergencyBtnFontSize),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// 현장 정보
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              Transition(
                                  child: SiteInfoPageAll(),
                                  transitionEffect:
                                      TransitionEffect.RIGHT_TO_LEFT),
                            );
                          },
                          // 내부 컴포넌트
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 아이콘
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(homePage_iconRound),
                                      border: Border.all(
                                          color:
                                          Color(themaColor_yellow), width: homePage_iconWeight)),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: getFullScrennSizePercent(
                                        context, homePage_iconSize),
                                    color: Color(themaColor_yellow),
                                  )),
                              Container(
                                height: getFullScrennSizePercent(context, homePage_spacePerIcon),
                              ),
                              // 텍스트
                              Text(
                                "Workspace",
                                style:
                                    TextStyle(color: Color(themaColor_whiteBlack)),
                                textAlign: TextAlign.center,
                              ),
                            ],
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
                                      TransitionEffect.RIGHT_TO_LEFT),
                            );
                          },
                          // 내부 컴포넌트
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 아이콘
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(homePage_iconRound),
                                      border: Border.all(
                                          color:
                                          Color(themaColor_yellow), width: homePage_iconWeight)),
                                  child: Icon(
                                    Icons.group,
                                    size: getFullScrennSizePercent(
                                        context, homePage_iconSize),
                                    color: Color(themaColor_yellow),
                                  )),
                              // 간격
                              Container(height: getFullScrennSizePercent(context, homePage_spacePerIcon),),
                              // 텍스트
                              Text(
                                "People",
                                style:
                                    TextStyle(color: Color(themaColor_whiteBlack)),
                                textAlign: TextAlign.center,
                              ),
                            ],
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
