import 'package:cherry_app/All_SignUpPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

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

                Text(
                  "Select your role",
                  style: TextStyle(fontSize: allPage_titleFontSize),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, allPage_spacePerTitleAndComponents),
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
                            Transition(child: SignUpPage(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
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
                                color: Color(themaColor_black),
                                width: allPage_btnBorderWidth),
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
                            Transition(child: SignUpPage(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
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
                                color: Color(themaColor_black),
                                width: allPage_btnBorderWidth),
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
                )
              ],
            ),
          ),
        ),
      );
}
