import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Dialog.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'All_HomePage.dart';

class ViewEmpInfoPage extends StatefulWidget {
  late int userId;

  ViewEmpInfoPage(int userId) : this.userId = userId;

  @override
  State<ViewEmpInfoPage> createState() => _ViewEmpInfoPage(userId);
}

class _ViewEmpInfoPage extends State<ViewEmpInfoPage> {
  late int userId;
  String userName = "";
  String userRole = "";
  int userAge = -1;
  String userEmail = "";
  String userPhone = "";

  int _dropdownVal = 0;

  _ViewEmpInfoPage(int userId) : this.userId = userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUserInfo(userId);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerAll(),

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
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context, Transition(child: HomePageAll()), (_) => false);
              },
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
                  /// 위, 아래 공간
                  Container(
                    height:
                        getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),

                  /// 타이틀
                  Text(
                    "User information",
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

                  Container(
                    height: getFullScrennSizePercent(context, 10),
                  ),

                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    padding: EdgeInsets.all(getFullScrennSizePercent(
                        context, viewPeopleInfoPage_padding)),
                    color: Color(themaColor_whiteYellow),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: getFullScrennSizePercent(
                              context, viewPeopleInfoPage_padding),
                          bottom: getFullScrennSizePercent(
                              context, viewPeopleInfoPage_padding)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 이름
                          Text(
                            "Name:",
                            style: TextStyle(
                                color: Color(themaColor_whiteBlack),
                                fontSize: viewPeopleInfoPage_smallFontSize),
                          ),
                          Text(
                            "    $userName",
                            style: TextStyle(
                                color: Color(themaColor_black),
                                fontSize: viewPeopleInfoPage_fontSize),
                          ),
                          Divider(
                            height: 0,
                          ),

                          // 등급 변경
                          Text(
                            "\nRole:",
                            style: TextStyle(
                                color: Color(themaColor_whiteBlack),
                                fontSize: viewPeopleInfoPage_smallFontSize),
                          ),
                          if (global_userRole == enum_Role.manager)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "    ",
                                  style: TextStyle(
                                      color: Color(themaColor_black),
                                      fontSize: viewPeopleInfoPage_fontSize),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(themaColor_whiteYellow),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(
                                                viewPeopleInfoPage_offset,
                                                viewPeopleInfoPage_offset),
                                            blurRadius:
                                                viewPeopleInfoPage_blueray,
                                            color: Color(themaColor_whiteBlack))
                                      ]),
                                  child: DropdownButton(
                                      alignment: AlignmentDirectional.center,
                                      value: _dropdownVal,
                                      isDense: true,
                                      style: TextStyle(
                                          color: Color(themaColor_black),
                                          fontSize: viewPeopleInfoPage_fontSize,
                                          fontWeight: FontWeight.normal),
                                      items: [
                                        DropdownMenuItem(
                                            value: 0,
                                            child: Text(
                                              "USER",
                                            )),
                                        DropdownMenuItem(
                                            value: 1,
                                            child: Text(
                                              "STAFF",
                                            )),
                                      ],
                                      onChanged: (e) async {
                                        // user
                                        if (e == 0) {
                                          late Response res;
                                          try {
                                            res =
                                                await api_admin_changeUserRole(
                                                    this.userId, "USER");
                                            setState(() {
                                              this.userRole = "USER";
                                              this._dropdownVal = 0;
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                getSnackBar("User role has been changed."));
                                          } catch (e) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                getSnackBar("User role change failed."));
                                          }
                                        }
                                        // staff
                                        else if (e == 1) {
                                          late Response res;
                                          try {
                                            res =
                                                await api_admin_changeUserRole(
                                                    this.userId, "STAFF");
                                            setState(() {
                                              this.userRole = "STAFF";
                                              this._dropdownVal = 1;
                                            });
                                          } catch (e) {}
                                        }
                                        _dropdownVal = e!;
                                      }),
                                ),
                              ],
                            ),
                          if (global_userRole != enum_Role.manager)
                            Text(
                              "    $userRole",
                              style: TextStyle(
                                  color: Color(themaColor_black),
                                  fontSize: viewPeopleInfoPage_fontSize),
                            ),
                          Divider(
                            height: 0,
                          ),

                          // 나이
                          Text(
                            "\nAge:",
                            style: TextStyle(
                                color: Color(themaColor_whiteBlack),
                                fontSize: viewPeopleInfoPage_smallFontSize),
                          ),
                          Text(
                            "    $userAge",
                            style: TextStyle(
                                color: Color(themaColor_black),
                                fontSize: viewPeopleInfoPage_fontSize),
                          ),
                          Divider(
                            height: 0,
                          ),

                          // 휴대전화
                          Text(
                            "\nPhone:",
                            style: TextStyle(
                                color: Color(themaColor_whiteBlack),
                                fontSize: viewPeopleInfoPage_smallFontSize),
                          ),
                          Text(
                            "    $userPhone",
                            style: TextStyle(
                                color: Color(themaColor_black),
                                fontSize: viewPeopleInfoPage_fontSize),
                          ),
                          Divider(
                            height: 0,
                          ),

                          // 이메일
                          Text(
                            "\nEmail:",
                            style: TextStyle(
                                color: Color(themaColor_whiteBlack),
                                fontSize: viewPeopleInfoPage_smallFontSize),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "    $userEmail",
                              style: TextStyle(
                                  color: Color(themaColor_black),
                                  fontSize: viewPeopleInfoPage_fontSize),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Divider(
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerBottomBtn),
                  ),

                  /// 쫒아내기 버튼
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => CheckAlertDialog(
                              "Are you sure you want to Delete that user out?",
                              "Back",
                              "Delete")).then((value) async {
                        print(value);
                        if (value) {
                          late Response res;
                          try {
                            res = await api_admin_deleteEmp(this.userId);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("You have successfully removed the user."));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("User removal failed"));
                          }
                        }
                      });
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트
                        Text(
                          "Delete",
                          style: TextStyle(
                              color: Color(themaColor_red),
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
                              color: Color(themaColor_red),
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

  /// 정보 초기화
  Future<void> updateUserInfo(int userId) async {
    late Response res;
    try {
      res = await api_admin_getUserInfo(userId);
      setState(() {
        this.userName = res.data['data']['userName'];
        this.userRole = res.data['data']['role'];
        this.userAge = res.data['data']['userAge'];
        this.userEmail = res.data['data']['userEmail'];
        this.userPhone = res.data['data']['userPhoneNum'];

        if (this.userRole == 'USER')
          this._dropdownVal = 0;
        else if (this.userRole == "STAFF") this._dropdownVal = 1;
      });
    } catch (e) {}
  }
}
