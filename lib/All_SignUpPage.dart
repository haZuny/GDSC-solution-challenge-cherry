import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/Manager_PutSiteInfoPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

import 'AppBar_Drawer.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
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
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  Text(
                    "Put your info",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  /// 이름 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_signUpTFWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Name",
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
                          offset: Offset(allPage_shadowOffSet,
                              allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                  ),

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, signUpPage_spacePerTFs),
                  ),

                  /// 휴대전화 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_signUpTFWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Phone number",
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

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, signUpPage_spacePerTFs),
                  ),

                  /// 나이 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_signUpTFWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Age",
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

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, signUpPage_spacePerNextBtn),
                  ),

                  // next 버튼
                  TextButton(
                      onPressed: () {
                        // 근로자 가입으로 이동
                        if (global_signUpClass == SignUpClass.employee) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PutCheckCodePageEmp()));
                        }
                        // 관리자 가입으로 이동
                        else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PutSiteInfoPageManager()));
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
}
