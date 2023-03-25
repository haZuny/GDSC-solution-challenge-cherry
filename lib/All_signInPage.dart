import 'package:cherry_app/All_SelectRolePage.dart';
import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/All_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transition/transition.dart';

import 'All_PutSiteInfoPage.dart';
import 'AppBar_Drawer.dart';
import 'Emp_WaitingAcceptPage.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearGlobalVar();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarAll(),
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
                    bool _waitingAccept = false;

                    try {
                      await global_googleSignIn!.signOut();
                      print(">>> 구글 로그아웃");
                    } catch (e) {}

                    // google auth
                    global_googleSignIn = GoogleSignIn();
                    global_googleUser = await global_googleSignIn?.signIn();


                    if (global_googleUser != null) {
                      // Admin SignIn
                      try {
                        Response res =
                            await api_admin_signIn(global_googleUser!.email);
                        // 변수 설정
                        _signInRole = res.data['data']['role'];
                        global_haveSite = res.data['data']['existSiteInfo'];
                        global_userId = res.data['data']['id'];
                        authorization =
                            res.headers['authorization']![0].split(' ')[1];
                        refreshToken = res.headers['refreshToken']![0];
                        dio.options.headers = {
                          'Authorization': "bearer " + authorization,
                        };
                        ScaffoldMessenger.of(context)
                            .showSnackBar(getSnackBar("Login successful."));
                      } catch (e) {}

                      // User SignIn
                      try {
                        Response res =
                            await api_user_signIn(global_googleUser!.email);
                        // 변수 설정
                        _signInRole = res.data['data']['role'];
                        global_haveSite = res.data['data']['existSiteInfo'];
                        _waitingAccept = res.data['data']['waitingAccept'];
                        global_userId = res.data['data']['id'];
                        authorization =
                            res.headers['authorization']![0].split(' ')[1];
                        refreshToken = res.headers['refreshToken']![0];
                        dio.options.headers = {
                          'Authorization': "bearer " + authorization,
                        };
                        ScaffoldMessenger.of(context)
                            .showSnackBar(getSnackBar("Login successful."));
                      } catch (e) {}

                      if (_signInRole == "ADMIN") {
                        global_userRole = enum_Role.manager;
                        // 관리자 홈페이지로 이동
                        if (global_haveSite) {
                          Navigator.pushReplacement(
                            context,
                            Transition(
                              child: HomePageAll(),
                              transitionEffect: TransitionEffect.FADE,
                            ),
                          );
                        } else {
                          // 관리자 현장 생성 페이지로 이동
                          Navigator.push(
                              context,
                              Transition(
                                  child: PutSiteInfoPageAll(),
                                  transitionEffect:
                                      TransitionEffect.RIGHT_TO_LEFT));
                        }
                      } else if (_signInRole == "GUEST") {
                        // 승인 대기중
                        if (_waitingAccept) {
                          Navigator.push(
                              context,
                              Transition(
                                  child: WaitingAcceptPage(),
                                  transitionEffect:
                                      TransitionEffect.RIGHT_TO_LEFT));
                        }
                        // 현장 코드 입력해야함
                        else {
                          Navigator.push(
                              context,
                              Transition(
                                  child: PutCheckCodePageEmp(),
                                  transitionEffect:
                                      TransitionEffect.RIGHT_TO_LEFT));
                        }
                      }
                      // 유저
                      else if (_signInRole == "USER") {
                        global_userRole = enum_Role.user;
                        Navigator.pushReplacement(
                            context,
                            Transition(
                                child: HomePageAll(),
                                transitionEffect: TransitionEffect.FADE));
                      }
                      // 스탭
                      else if (_signInRole == "STAFF") {
                        global_userRole = enum_Role.staff;
                        Navigator.pushReplacement(
                            context,
                            Transition(
                                child: HomePageAll(),
                                transitionEffect: TransitionEffect.FADE));
                      }
                      // 회원가입 안함
                      else {
                        // 회원가입 페이지로 이동
                        Navigator.push(
                            context,
                            Transition(
                                child: SelectRolePage(),
                                transitionEffect:
                                    TransitionEffect.RIGHT_TO_LEFT));
                      }
                    } else {
                      print(">>> 구글 로그인 실패");
                      ScaffoldMessenger.of(context).showSnackBar(getSnackBar("Google login failed."));
                    }
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

  /// 변수 초기화
  void resetVal() {}
}
