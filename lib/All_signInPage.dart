import 'package:cherry_app/All_SelectRolePage.dart';
import 'package:cherry_app/All_SignUpPage.dart';
import 'package:cherry_app/Emp_HomePage.dart';
import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/Manager_HomePage.dart';
import 'package:cherry_app/Manager_PutSiteInfoPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transition/transition.dart';

import 'AppBar_Drawer.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  String _signInRole = 'null';
  bool _siteAssigned = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarNone(),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// 로고 이미지
                Image.asset(
                  'assets/img/logo.png',
                  width:
                      getFullScrennSizePercent(context, signInPage_logoWidth),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, signInPage_spacePerLogo),
                ),

                /// 로그인 버튼
                ElevatedButton(
                  onPressed: () async {
                    // 변수 초기화
                    String _signInRole = 'null';
                    bool _siteAssigned = false;

                    // googleSignIn?.signOut();

                    // google auth
                    global_googleSignIn = GoogleSignIn();
                    global_googleUser = await global_googleSignIn?.signIn();

                    // Admin SignIn
                    try {
                      Response res = await api_admin_signIn(global_googleUser!.email);
                      // 변수 설정
                      _signInRole = res.data['data']['role'];
                      _siteAssigned = res.data['data']['existSiteInfo'];
                      authorization =
                          res.headers['authorization']![0].split(' ')[1];
                      refreshToken = res.headers['refreshToken']![0];
                      dio.options.headers = {
                        'Authorization': "bearer " + authorization,
                      };
                    } catch (e) {}

                    // User SignIn
                    try {
                      Response res = await api_user_signIn(global_googleUser!.email);
                      // 변수 설정
                      _signInRole = res.data['data']['role'];
                      _siteAssigned = res.data['data']['existSiteInfo'];
                      authorization =
                          res.headers['authorization']![0].split(' ')[1];
                      refreshToken = res.headers['refreshToken']![0];
                      dio.options.headers = {
                        'Authorization': "bearer " + authorization,
                      };
                    } catch (e) {}

                    if (_signInRole == "ADMIN") {
                      // 관리자 홈페이지로 이동
                      if (_siteAssigned) {
                        Navigator.pushReplacement(
                          context,
                          Transition(child: HomePageManager(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                        );
                      } else {
                        // 관리자 현장 생성 페이지로 이동
                        Navigator.pushReplacement(
                            context,
                            Transition(child: PutSiteInfoPageManager(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                      }
                      print(">>> 관리자 로그인 성공");
                    } else if (_signInRole == "GUEST") {
                      // 게스트 홈페이지로 이동
                      if (_siteAssigned) {
                        Navigator.pushReplacement(
                            context,
                            Transition(child: HomePageEmp(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                      } else {
                        // 게스트 현장 가입 페이지로 이동
                        Navigator.pushReplacement(
                            context,
                            Transition(child: PutCheckCodePageEmp(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                      }
                      print(">>> 근로자 로그인 성공");
                    } else {
                      // 회원가입 페이지로 이동
                      Navigator.push(
                          context,
                          Transition(child: SelectRolePage(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
                    }
                    // googleSignIn.signOut();
                  },
                  // 내부 컴포넌트
                  child: ListTile(
                      leading: Image.asset("assets/img/google_logo.png",
                          width: getFullScrennSizePercent(
                              context, siginInPage_googleLogoSize_width),
                          height: getFullScrennSizePercent(
                              context, siginInPage_googleLogoSize_width)),
                      title: Text(
                        "Sign in with Google",
                      )),
                  style: ElevatedButton.styleFrom(
                      // 크기 설정
                      minimumSize: Size(
                          getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          getFullScrennSizePercent(
                              context, signInPage_loginBtnHeight)),
                      maximumSize: Size(
                          getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          getFullScrennSizePercent(
                              context, signInPage_loginBtnHeight)),
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
                )
              ],
            ),
          ),
        ),
      );

  /// 변수 초기화
  void resetVal() {}
}
