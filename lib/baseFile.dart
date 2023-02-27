import 'package:flutter/cupertino.dart';


/// 공통
// Color
int themaColor_white = 0xFFFFFFFF; // 하얀색
int themaColor_black = 0xFF000000;  // 검정색
// Size(Percent)
// int allPage_singleBtnWidth = 50;
// Radius
double allPage_btnRadius = 10;  // 버튼 둥글기

/// SignInPage
// Size(Percent)
int signInPage_widgetSpace = 5; // 로고와 버튼 사이의 간격
int signInPage_logoWidth = 70;  // 로고 가로 크기
int signInPage_loginBtnWidth = 80;  // 로그인 버튼 가로
int signInPage_loginBtnHeight = 8;  // 로그인 버튼 세로
int siginInPage_googleLogoSize_width = 8; // 구글 로그 사이즈
int siginInPage_googleLogoFontColor = 0xffb4b4b4; // 구글 로그 사이즈
// Width
double signInPage_loginBtnBorderWidth = 0.1;

double getFullScrennSizePercent(BuildContext context, int percent, bool isWidth){
  if (isWidth)
    return MediaQuery.of(context).size.width * percent / 100;
  else
    return MediaQuery.of(context).size.height * percent / 100;
}