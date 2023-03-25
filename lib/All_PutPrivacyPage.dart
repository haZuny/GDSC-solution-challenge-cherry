import 'package:cherry_app/All_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';
import 'Emp_PutCheckCodePage.dart';
import 'All_PutSiteInfoPage.dart';

class PutPrivacyPage extends StatefulWidget {
  @override
  State<PutPrivacyPage> createState() => _PutPrivacyPage();
}

class _PutPrivacyPage extends State<PutPrivacyPage> {
  TextEditingController _nameTFController = TextEditingController();
  TextEditingController _phnumTFController = TextEditingController();
  TextEditingController _ageTFController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (global_haveSite) {
      _nameTFController.text = global_userName;
      _phnumTFController.text = global_userPhoneNum;
      _ageTFController.text = global_userAge.toString();
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: global_haveSite ? DrawerAll() : null,

          /// bottom bar
          bottomNavigationBar: global_haveSite
              ? BottomAppBar(
                  child: Container(
                    height: getFullScrennSizePercent(
                        context, bottomBar_bottomBarHeight),
                  ),
                  shape: CircularNotchedRectangle(),
                  color: Color(themaColor_white),
                  notchMargin: getFullScrennSizePercent(
                      context, bottomBar_bottomBarNorch),
                )
              : null,

          /// floating btn
          floatingActionButton: global_haveSite
              ? Padding(
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
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          Transition(child: HomePageAll()), (_) => false);
                    },
                  ),
                )
              : null,

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
                  /// 위, 아래 공간
                  Container(
                    height:
                        getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),

                  /// 타이틀
                  Text(
                    global_haveSite
                        ? "Edit your Information"
                        : "Put your Information",
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
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

                  /// Back 버튼
                  if (!global_haveSite)
                    ElevatedButton(
                      onPressed: () async {
                        await global_googleSignIn?.signOut();
                        print(">>> 구글 로그아웃");
                        Navigator.pushAndRemoveUntil(context,
                            Transition(child: SignInPage()), (_) => false);
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

                  if (!global_haveSite)

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, EditPrivacyPage_spacePerBtn),
                    ),

                  /// Done 버튼
                  ElevatedButton(
                    onPressed: () async {
                      String name = _nameTFController.text;
                      String phNum = _phnumTFController.text;
                      String age = _ageTFController.text;

                      // 널처리
                      if (name == "") {
                        print(">>> Empty Name");
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar("Input your name, please."));
                        return;
                      }
                      if (phNum == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar("Input your phone number, please."));
                        print(">>> Empty PhoneNum");
                        return;
                      }
                      if (age == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar("Input your age, please."));
                        print(">>> Empty Age");
                        return;
                      }

                      late Response res;

                      /// 수정
                      if (global_haveSite) {
                        // 관리자
                        if (global_userRole == enum_Role.manager) {
                          try {
                            res = await api_admin_editPrivacy(name, phNum, age);
                            global_userRole = enum_Role.manager;
                            Navigator.pushAndRemoveUntil(context,
                                Transition(child: HomePageAll()), (_) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("Changes have been applied."));
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(getSnackBar("Change failed."));
                          }
                        }
                        // 유저
                        else {
                          try {
                            res = await api_user_editPrivacy(name, phNum, age);
                            global_userRole = enum_Role.user;
                            Navigator.pushAndRemoveUntil(context,
                                Transition(child: HomePageAll()), (_) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("Changes have been applied."));
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(getSnackBar("Change failed."));
                          }
                        }
                      }

                      /// 가입
                      else {
                        // 근로자 가입
                        if (global_userRole == enum_Role.user) {
                          try {
                            res = await api_user_signUp(
                                global_googleUser!.email, name, phNum, age);
                            Navigator.pushReplacement(
                                context,
                                Transition(
                                    child: PutCheckCodePageEmp(),
                                    transitionEffect:
                                        TransitionEffect.RIGHT_TO_LEFT));
                            authorization =
                                res.headers['authorization']![0].split(' ')[1];
                            refreshToken = res.headers['refreshToken']![0];
                            global_userId = res.data['data'];
                            dio.options.headers = {
                              'Authorization': "bearer " + authorization,
                            };
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar(
                                    "You have successfully signed up."));
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(getSnackBar("Sign up failed."));
                          }
                        }
                        // 관리자 가입
                        else {
                          try {
                            res = await api_admin_signUp(
                                global_googleUser!.email, name, phNum, age);
                            Navigator.pushReplacement(
                                context,
                                Transition(
                                    child: PutSiteInfoPageAll(),
                                    transitionEffect:
                                        TransitionEffect.RIGHT_TO_LEFT));
                            authorization =
                                res.headers['authorization']![0].split(' ')[1];
                            refreshToken = res.headers['refreshToken']![0];
                            global_userId = res.data['data'];
                            dio.options.headers = {
                              'Authorization': "bearer " + authorization,
                            };
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar(
                                    "You have successfully signed up."));
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(getSnackBar("Sign up failed."));
                          }
                        }
                      }
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트
                        Text(
                          "Done",
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
