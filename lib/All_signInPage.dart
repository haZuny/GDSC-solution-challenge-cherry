import 'package:cherry_app/All_SelectRolePage.dart';
import 'package:cherry_app/All_SignUpPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'AppBar_Drawer.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
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
                  width: getFullScrennSizePercent(
                      context, signInPage_logoWidth),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, signInPage_spacePerLogo),
                ),

                /// 로그인 버튼
                ElevatedButton(
                  onPressed: () async {
                    print("===========");
                    googleUser = await GoogleSignIn(scopes: [
                      'email',
                      'https://www.googleapis.com/auth/contacts.readonly',
                      "https://www.googleapis.com/auth/userinfo.profile"
                    ],).signIn(

                    );
                    print((await googleUser?.authentication)?.idToken);
                    print((await googleUser?.authentication)?.accessToken);
                    // print((await googleUser?.authentication)?.idToken);

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectRolePage()));
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
}
