import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';

class WaitingAcceptPage extends StatefulWidget {
  @override
  State<WaitingAcceptPage> createState() => _WaitingAcceptPage();
}

class _WaitingAcceptPage extends State<WaitingAcceptPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
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
                    "Waiting accept",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, waitingAcceptPage_spacePerNextBtn),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Back 버튼
                      TextButton(
                          onPressed: () async {
                            late Response res;
                            try {
                              res = await api_user_logout();
                            } catch (e) {}
                            await global_googleSignIn?.signOut();
                            print(">>> 구글 로그아웃");
                            Navigator.pushAndRemoveUntil(
                                context,
                                Transition(
                                    child: SignInPage(),
                                    transitionEffect:
                                        TransitionEffect.LEFT_TO_RIGHT),
                                (_) => false);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: allPage_btnFontSize,
                                color: Color(allPage_btnFontColor)),
                          )),

                      // 간격
                      Container(
                          width: getFullScrennSizePercent(
                              context, waitingAcceptPage_spaceBottomBtn)),

                      /// 다시 입력 버튼
                      TextButton(
                          onPressed: () async {
                            late Response res;
                            try {
                              res =
                                  await api_user_cancleCheckCode(global_userId);
                              if (res.data['success']) {
                                Navigator.pushReplacement(
                                    context,
                                    Transition(
                                        child: PutCheckCodePageEmp(),
                                        transitionEffect:
                                            TransitionEffect.RIGHT_TO_LEFT));
                              }
                            } catch (e) {}
                          },
                          child: Text(
                            "Re-type",
                            style: TextStyle(
                                fontSize: allPage_btnFontSize,
                                color: Color(allPage_btnFontColor)),
                          )),
                    ],
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
}
