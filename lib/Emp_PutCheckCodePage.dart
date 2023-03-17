import 'package:cherry_app/All_signInPage.dart';
import 'package:cherry_app/Emp_WaitingAcceptPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:transition/transition.dart';

import 'AppBar_Drawer.dart';

class PutCheckCodePageEmp extends StatefulWidget {
  @override
  State<PutCheckCodePageEmp> createState() => _PutCheckCodePageEmp();
}

class _PutCheckCodePageEmp extends State<PutCheckCodePageEmp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarNone(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, putCheckCodePage_spacePerBottomBtn),
                  ),

                  Text(
                    "Put check code",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  /// 현장코드 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Code",
                        hintStyle:
                            TextStyle(color: Color(themaColor_whiteBlack)),
                        // 색상(설정 안하면 그림자에 먹힘)
                        filled: true,
                        fillColor: Colors.white,
                        // 선택 안됐을때 테두리
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                        // 선택 됐을때 테두리
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                      ),
                    ),
                    // 그림자
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: allPage_shadowBlurRadius,
                          offset: Offset(
                              allPage_shadowOffSet, allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                  ),

                  /// check 버튼
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Check",
                          style: TextStyle(
                              fontSize: putCheckCodePage_checkBtnFontSize,
                              color: Color(allPage_btnSubFontColor)),
                        )),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, putCheckCodePage_spacePerBottomBtn),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Back 버튼
                      TextButton(
                          onPressed: () {
                            global_googleSignIn?.signOut();
                            api_user_logout();
                            print(">>> Google SignOut");
                            Navigator.pushReplacement(
                                context,
                                Transition(child: SignInPage()));
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: allPage_btnFontSize,
                                color: Color(allPage_btnFontColor)),
                          )),

                      // 간격
                      Container(width: getFullScrennSizePercent(context, putCheckCodePage_spaceBottomBtn)),

                      /// next 버튼
                      if (isChecked)
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  Transition(child: WaitingAcceptPage(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: allPage_btnFontSize,
                                  color: Color(allPage_btnFontColor)),
                            )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
