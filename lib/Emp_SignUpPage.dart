import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class SignUpPageEmp extends StatefulWidget {
  @override
  State<SignUpPageEmp> createState() => _SignUpPageEmp();
}

class _SignUpPageEmp extends State<SignUpPageEmp> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Put your info",
                  style: TextStyle(fontSize: allPage_titleFontSize),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, allPage_spacePerTitleAndComponents, false),
                ),

                /// 이름 TF
                Container(
                  width: getFullScrennSizePercent(
                      context, allPage_signUpTFWidth, true),
                  child: TextField(
                    decoration: InputDecoration(
                      // 힌트
                      hintText: "Name",
                      hintStyle: TextStyle(color: Color(themaColor_whiteBlack)),
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
                      context, signUpPage_spacePerTFs, false),
                ),

                /// 휴대전화 TF
                Container(
                  width: getFullScrennSizePercent(
                      context, allPage_signUpTFWidth, true),
                  child: TextField(
                    decoration: InputDecoration(
                      // 힌트
                      hintText: "Phone number",
                      hintStyle: TextStyle(color: Color(themaColor_whiteBlack)),
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
                      context, signUpPage_spacePerTFs, false),
                ),

                /// 나이 TF
                Container(
                  width: getFullScrennSizePercent(
                      context, allPage_signUpTFWidth, true),
                  child: TextField(
                    decoration: InputDecoration(
                      // 힌트
                      hintText: "Age",
                      hintStyle: TextStyle(color: Color(themaColor_whiteBlack)),
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
                      context, signUpPage_spacePerNextBtn, false),
                ),

                // next 버튼
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PutCheckCodePage()));
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
      );
}
