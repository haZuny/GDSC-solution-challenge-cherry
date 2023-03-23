import 'package:cherry_app/All_PutPrivacyPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';

class SelectRolePage extends StatefulWidget {
  @override
  State<SelectRolePage> createState() => _SelectRolePage();
}

class _SelectRolePage extends State<SelectRolePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarAll(),
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
                  "User information",
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
                      context, selectRolePage_spacePerTitle),
                ),

                /// 선택 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Manager
                    ElevatedButton(
                      onPressed: () {
                        global_userRole = enum_Role.manager;
                        Navigator.pushReplacement(
                            context,
                            Transition(
                                child: PutPrivacyPage(),
                                transitionEffect:
                                    TransitionEffect.RIGHT_TO_LEFT));
                      },
                      // 내부 컴포넌트
                      child: Text(
                        "Manager",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          // 크기 설정
                          minimumSize: Size(
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnWidth),
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnHeight)),
                          maximumSize: Size(
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnWidth),
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnHeight)),
                          // 모양 및 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(allPage_btnRadius),
                            side: BorderSide(
                                color: Color(themaColor_yellow),
                                width: allPage_addBtnWidth),
                          ),

                          // 배경 색상 설정
                          backgroundColor: Color(themaColor_white),
                          // 그림자 투명도
                          elevation: 10),
                    ),
                    // 간격
                    Container(
                      width: getFullScrennSizePercent(
                          context, selectRolePage_widgetSpaceRow),
                    ),

                    /// Employee
                    ElevatedButton(
                      onPressed: () {
                        global_userRole = enum_Role.user;
                        Navigator.pushReplacement(
                            context,
                            Transition(
                                child: PutPrivacyPage(),
                                transitionEffect:
                                    TransitionEffect.RIGHT_TO_LEFT));
                      },
                      // 내부 컴포넌트
                      child: Text(
                        "Employee",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          // 크기 설정
                          minimumSize: Size(
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnWidth),
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnHeight)),
                          maximumSize: Size(
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnWidth),
                              getFullScrennSizePercent(
                                  context, selectRolePage_loginBtnHeight)),
                          // 모양 및 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(allPage_btnRadius),
                            side: BorderSide(
                                color: Color(themaColor_yellow),
                                width: allPage_addBtnWidth),
                          ),

                          // 배경 색상 설정
                          backgroundColor: Color(themaColor_white),
                          // 그림자 투명도
                          elevation: 10),
                    ),
                  ],
                ),
                
                Container(height: getFullScrennSizePercent(context, selectRolePage_spacePerBottomBtn),),

                ElevatedButton(
                  onPressed: () async {
                    await global_googleSignIn?.signOut();
                    print(">>> 구글 로그아웃");
                    Navigator.pushAndRemoveUntil(
                        context, Transition(child: SignInPage()), (_) => false);
                  },
                  // 내부 컴포넌트
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 텍스트
                      Text(
                        "Back",
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
      );
}
