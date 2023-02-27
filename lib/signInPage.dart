import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// 로고 이미지
              Image.asset(
                'assets/img/logo.png',
                width: getFullScrennSizePercent(
                    context, signInPage_logoWidth, true),
              ),

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, signInPage_widgetSpace, false),
              ),

              /// 로그인 버튼
              ElevatedButton(
                onPressed: () {},
                // 내부 컴포넌트
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // 구글 로고
                    Image.asset("assets/img/google_logo.png",
                        width: getFullScrennSizePercent(
                            context, siginInPage_googleLogoSize_width, true),
                        height: getFullScrennSizePercent(
                            context, siginInPage_googleLogoSize_width, true)),
                    // 로그인 글자
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                          color: Color(siginInPage_googleLogoFontColor)),
                    )
                  ],
                )),
                style: ElevatedButton.styleFrom(
                    // 크기 설정
                    minimumSize: Size(
                        getFullScrennSizePercent(
                            context, signInPage_loginBtnWidth, true),
                        getFullScrennSizePercent(
                            context, signInPage_loginBtnHeight, false)),
                    maximumSize: Size(
                        getFullScrennSizePercent(
                            context, signInPage_loginBtnWidth, true),
                        getFullScrennSizePercent(
                            context, signInPage_loginBtnHeight, false)),
                    // 모양 및 테두리 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(allPage_btnRadius),
                      side: BorderSide(
                          color: Color(themaColor_black),
                          width: signInPage_loginBtnBorderWidth),
                    ),

                    // 배경 색상 설정
                    backgroundColor: Color(themaColor_white),
                    // 그림자 투명도
                    elevation: 10),
              )
            ],
          ),
        ),
      );
}
