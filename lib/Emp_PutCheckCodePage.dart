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
  String checkCode = "";
  TextEditingController checkCodeController = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // reset
    isChecked = false;
  }

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
                    "Put site check code",
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
                      // color: Color(themaColor_yellow),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// 타이틀과 서브타이틀 사이 공간
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndSubTitme),
                  ),

                  /// 서브타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.center,
                    child: Text(
                      "C H E R R Y",
                      style: TextStyle(
                        color: Color(themaColor_white),
                        fontSize: allPage_subTitleFontSize,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(themaColor_yellow),
                        borderRadius:
                            BorderRadius.circular(allPage_subTitleLineRadius)),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, putCheckCodePage_spaceTitle),
                  ),

                  /// 현장코드 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      controller: checkCodeController,
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
                        // 현장코드 유효 여부 조회
                        onPressed: () async {
                          // 현장코드
                          checkCode = checkCodeController.text;
                          // 현장 코드 유효 여부 조회
                          late Response res;
                          try {
                            res = await api_site_vaildCheck(checkCode);
                            // 현장코드 조회
                            if (res.data['data'] == true) {
                              setState(() {
                                isChecked = true;
                              });
                              print(">>> 현장코드 존재");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(getSnackBar("Check succeeded."));
                            } else {
                              setState(() {
                                isChecked = false;
                              });
                              print(">>> 현장코드 없음");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(getSnackBar("Check failed."));
                            }
                          } catch (e) {
                            setState(() {
                              isChecked = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(getSnackBar("Check failed."));
                          }
                        },
                        child: Text(
                          "Check",
                          style: TextStyle(
                              fontSize: putCheckCodePage_checkBtnFontSize,
                              color: Color(isChecked
                                  ? themaColor_blue
                                  : themaColor_red)),
                        )),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, putCheckCodePage_spaceBottomBtn),
                  ),

                  /// Back 버튼
                  ElevatedButton(
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
                              child: SignInPage()),
                          (_) => false);
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트
                        Text(
                          "Back",
                          style: TextStyle(
                              color: Color(themaColor_yellow),
                              fontSize: allPage_roundBtnFontSize),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        // 크기 설정
                        minimumSize: Size(
                            getFullScrennSizePercent(
                                context, allPage_roundBtnWidth),
                            getFullScrennSizePercent(
                                context, allPage_roundBtnHeight)),
                        maximumSize: Size(
                            getFullScrennSizePercent(
                                context, allPage_roundBtnWidth),
                            getFullScrennSizePercent(
                                context, allPage_roundBtnHeight)),
                        // 모양 및 테두리 설정
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(allPage_roundBtnRadius),
                          side: BorderSide(
                              color: Color(themaColor_yellow),
                              width: allPage_addBtnWidth),
                        ),

                        // 배경 색상 설정
                        backgroundColor: Color(themaColor_white),
                        // 그림자 투명도
                        elevation: 10),
                  ),

                  if(isChecked)
                    Container(height: getFullScrennSizePercent(context, putCheckCodePage_spacePerBtns),),

                  /// Next 버튼
                  if (isChecked)
                    ElevatedButton(
                      onPressed: () async {
                        late Response res;
                        try {
                          res = await api_user_returnCheckCode(checkCode);
                          if (res.data['success']) {
                            Navigator.pushReplacement(
                                context,
                                Transition(
                                    child: WaitingAcceptPage(),
                                    transitionEffect:
                                        TransitionEffect.RIGHT_TO_LEFT));
                          }
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("On-site registration is requested."));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("Registration is failed."));
                        }
                      },
                      // 내부 컴포넌트
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 텍스트
                          Text(
                            "Next",
                            style: TextStyle(
                                color: Color(themaColor_yellow),
                                fontSize: allPage_roundBtnFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          // 크기 설정
                          minimumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          maximumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          // 모양 및 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(allPage_roundBtnRadius),
                            side: BorderSide(
                                color: Color(themaColor_yellow),
                                width: allPage_addBtnWidth),
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
        ),
      );
}
