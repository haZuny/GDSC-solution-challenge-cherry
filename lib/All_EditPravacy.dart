import 'package:cherry_app/Emp_HomePage.dart';
import 'package:cherry_app/Manager_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'AppBar_Drawer.dart';

class EditPrivacyPage extends StatefulWidget {
  @override
  State<EditPrivacyPage> createState() => _EditPrivacyPage();
}

class _EditPrivacyPage extends State<EditPrivacyPage> {
  TextEditingController _nameTFController = TextEditingController();
  TextEditingController _phnumTFController = TextEditingController();
  TextEditingController _ageTFController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTFController.text = global_userName;
    _phnumTFController.text = global_userPhoneNum;
    _ageTFController.text = global_userAge.toString();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer:
          global_userRole == enum_Role.user ? DrawerEmp() : DrawerManager(),

          /// bottom bar
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height:
                  getFullScrennSizePercent(context, bottomBar_bottomBarHeight),
            ),
            shape: CircularNotchedRectangle(),
            color: Color(themaColor_white),
            notchMargin:
                getFullScrennSizePercent(context, bottomBar_bottomBarNorch),
          ),

          /// floating btn
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
                bottom: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnMargin)),
            child: FloatingActionButton(
              child: Icon(
                Icons.home,
                size: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnSize),
              ),
              backgroundColor: Color(themaColor_yellow),
              onPressed: () {},
            ),
          ),

          /// floating btn location
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          /// body
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
                    "Edit your info",
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
                        context, EditPrivacyPage_spacePerTFs),
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
                        context, EditPrivacyPage_spacePerTFs),
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
                        context, EditPrivacyPage_spacePerNextBtn),
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

                        late Response res;
                        if (global_userRole == enum_Role.manager) {
                          // 관리자
                          try {
                            res = await api_admin_editPrivacy(name, phNum, age);
                            Navigator.pushAndRemoveUntil(
                                context,
                                Transition(
                                    child: HomePageManager(),
                                    transitionEffect:
                                        TransitionEffect.LEFT_TO_RIGHT),
                                (_) => false);
                          } catch (e) {}
                        }
                        // 유저
                        else if (global_userRole == enum_Role.user) {
                          try {
                            res = await api_user_editPrivacy(name, phNum, age);
                            Navigator.pushAndRemoveUntil(
                                context,
                                Transition(
                                    child: HomePageEmp(),
                                    transitionEffect:
                                        TransitionEffect.LEFT_TO_RIGHT),
                                (_) => false);
                          } catch (e) {}
                        }
                      },
                      child: Text(
                        "Done",
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
