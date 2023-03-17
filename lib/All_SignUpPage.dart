import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/Manager_PutSiteInfoPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'AppBar_Drawer.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  TextEditingController _nameTFController = TextEditingController();
  TextEditingController _phnumTFController = TextEditingController();
  TextEditingController _ageTFController = TextEditingController();

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
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      controller: _nameTFController,
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

                  /// 휴대전화 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _phnumTFController,
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
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _ageTFController,
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
                      onPressed: () async {
                        String name = _nameTFController.text;
                        String phNum = _phnumTFController.text;
                        String age = _ageTFController.text;

                        // 널처리
                        if (name == "") {
                          print(">>> Empty Name");
                          return;
                        }
                        if (phNum == "") {
                          print(">>> Empty PhoneNum");
                          return;
                        }
                        if (age == "") {
                          print(">>> Empty Age");
                          return;
                        }

                        // 근로자 가입
                        if (global_signUpClass == enum_Role.employee) {
                          try {
                            Response res = await api_user_signUp(
                                global_googleUser!.email, name, phNum, age);
                            if (res.data["success"]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PutCheckCodePageEmp()));
                            }
                            authorization = res.headers['authorization']![0].split(' ')[1];
                            refreshToken = res.headers['refreshToken']![0];
                            dio.options.headers = {
                              'Authorization': "bearer " + authorization,
                            };
                            print(">>> 근로자 회원가입 성공");
                          } catch (e) {
                            print(e);
                            print(">>> 근로자 회원가입 실패");
                          }
                        }
                        // 관리자 가입
                        else {
                          try {
                            Response res = await api_admin_signUp(
                                global_googleUser!.email, name, phNum, age);
                            if (res.data["success"]) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PutSiteInfoPageManager()));
                            }
                            authorization = res.headers['authorization']![0].split(' ')[1];
                            refreshToken = res.headers['refreshToken']![0];
                            dio.options.headers = {
                              'Authorization': "bearer " + authorization,
                            };
                            print(">>> 관리자 회원가입 성공");
                          } catch (e) {
                            print(">>> 관리자 회원가입 실패");
                          }
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

  /// API
  // AdminSignUp
  Future<Response> api_admin_signUp(String email, String adminName,
      String adminPhoneNum, String adminAge) async {
    String uri = api_hostURI + "admin/testSignUp?email=$email";
    Map body = {
      "adminName": adminName,
      "adminPhoneNum": adminPhoneNum,
      "adminAge": int.parse(adminAge)
    };
    Response res = await dio.post(uri, data: body);
    return res;
  }

  // UserSignUp
  Future<Response> api_user_signUp(String email, String userName,
      String userPhoneNum, String userAge) async {
    String uri = api_hostURI + "user/testSignUp?email=$email";
    Map body = {
      "adminName": userName,
      "adminPhoneNum": userPhoneNum,
      "adminAge": int.parse(userAge)
    };
    Response res = await dio.post(uri, data: body);
    return res;
  }
}
