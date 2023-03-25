import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Dialog.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'Manager_viewEmpInfoPage.dart';

class ManageEmpPageManager extends StatefulWidget {
  @override
  State<ManageEmpPageManager> createState() => _ManageEmpPageManager();
}

class _ManageEmpPageManager extends State<ManageEmpPageManager> {
  /// 현재 페이지
  int _currentPage = 0;

  /// User List
  List<EmpListTile> _checkedUserList = [];
  List<EmpListTile> _uncheckedUserList = [];
  List<WaiteListTile> _waitingUserList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 유저 리스트 조회
    updateWaitingList();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerAll(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _currentPage == 0
                  ? Icon(
                      Icons.radio_button_checked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(themaColor_blue),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(themaColor_blue)),
              _currentPage == 1
                  ? Icon(
                      Icons.radio_button_checked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(themaColor_blue),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(themaColor_blue)),
            ],
          ),
          body: PageView(
            /// 현재 페이지 설정
            onPageChanged: (val) {
              setState(() {
                _currentPage = val;
              });
            },
            children: [
              /// 첫번째 화면
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 위, 아래 공간
                      Container(
                        height: getFullScrennSizePercent(
                            context, allPage_spaceTopDown),
                      ),

                      /// 타이틀
                      Text(
                        "Checked list",
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
                          "C H E C K E D",
                          style: TextStyle(
                            color: Color(themaColor_white),
                            fontSize: allPage_subTitleFontSize,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(themaColor_yellow),
                            borderRadius: BorderRadius.circular(
                                allPage_subTitleLineRadius)),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerTitle),
                      ),

                      /// Checked 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page1_listFoemHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView.builder(
                            itemBuilder: (context, idx) =>
                                _checkedUserList[idx],
                            itemCount: _checkedUserList.length,
                          )),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerBigBox),
                      ),

                      /// 타이틀
                      Text(
                        "Unchecked list",
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
                          "U N C H E C K E D",
                          style: TextStyle(
                            color: Color(themaColor_white),
                            fontSize: allPage_subTitleFontSize,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(themaColor_yellow),
                            borderRadius: BorderRadius.circular(
                                allPage_subTitleLineRadius)),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerTitle),
                      ),

                      /// Unchecked 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page1_listFoemHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView.builder(
                            itemBuilder: (context, idx) =>
                                _uncheckedUserList[idx],
                            itemCount: _uncheckedUserList.length,
                          )),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerBtns),
                      ),

                      /// 모두 제거 버튼
                      ElevatedButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => CheckAlertDialog(
                                  "Are you sure you want to delete all users out?",
                                  "Back",
                                  "Delete")).then((value) async {
                            if (value) {
                              try {
                                for (EmpListTile tile in _uncheckedUserList) {
                                  late Response res;

                                  res = await api_admin_deleteUser(tile.userId);
                                }
                                for (EmpListTile tile in _checkedUserList) {
                                  late Response res;
                                  res = await api_admin_deleteUser(tile.userId);
                                }
                                updateUserList();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar("Removed all users."));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar("User removal failed."));
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
                              "Delete all",
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
                        height: getFullScrennSizePercent(
                            context, allPage_spaceTopDown),
                      ),
                    ],
                  ),
                ),
              ),

              /// 2번째 화면
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 위, 아래 공간
                      Container(
                        height: getFullScrennSizePercent(
                            context, allPage_spaceTopDown),
                      ),

                      /// 타이틀
                      Text(
                        "Waiting list",
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
                            borderRadius: BorderRadius.circular(
                                allPage_subTitleLineRadius)),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page2_spacePerTitle),
                      ),

                      /// 리스트 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page2_waiteListHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                _waitingUserList[index],
                            itemCount: _waitingUserList.length,
                          )),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page2_spacePerBtns),
                      ),

                      /// 모두 수락 버튼
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            for (WaiteListTile tile in _waitingUserList) {
                              late Response res;
                              res = await api_admin_acceptWaiting(tile.userId);
                            }
                            updateWaitingList();
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("Accepted all users."));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                getSnackBar("User acceptance failed."));
                          }
                        },
                        // 내부 컴포넌트
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 텍스트
                            Text(
                              "Accept all",
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

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page2_spacePerBtn),
                      ),

                      /// 모두 거절 버튼
                      ElevatedButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => CheckAlertDialog(
                                  "Are you sure you want to deny all users?",
                                  "Back",
                                  "Deny")).then((value) async {
                            print(value);
                            if (value) {
                              try {
                                for (WaiteListTile tile in _waitingUserList) {
                                  late Response res;
                                  res = await api_admin_deleteUser(tile.userId);
                                }
                                updateWaitingList();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar("Denied all users."));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar("Failure to deny user."));
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
                              "Delete all",
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
                        height: getFullScrennSizePercent(
                            context, allPage_spaceTopDown),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  /// user list update
  Future<void> updateUserList() async {
    // 초기화
    setState(() {
      _checkedUserList.clear();
      _uncheckedUserList.clear();
    });
    late Response res;
    try {
      res = await api_admin_getUserList(global_siteId);
      print(res);
      List checkedList = res.data['data']['checked'];
      List uncheckedList = res.data['data']['unchecked'];

      setState(() {
        // checked update
        for (Map user in checkedList) {
          if (user['role'] != "GUEST") {
            _checkedUserList.add(EmpListTile(user['id'], user['userName'],
                user['userAge'], user['role'], updateUserList));
          }
        }
        // unchecked update
        for (Map user in uncheckedList) {
          if (user['role'] != "GUEST") {
            _uncheckedUserList.add(EmpListTile(user['id'], user['userName'],
                user['userAge'], user['role'], updateUserList));
          }
        }
      });
    } catch (e) {}
  }

  /// waiting list update
  Future<void> updateWaitingList() async {
    // 초기화
    setState(() {
      _waitingUserList.clear();
    });

    late Response res;
    // waiting list update
    try {
      res = await api_admin_getWaitingList(global_siteId);
      setState(() {
        List dataList = res.data['data'];
        for (Map data in dataList) {
          _waitingUserList.add(WaiteListTile(data['userId'], data['userName'],
              data['userAge'], updateWaitingList));
        }
      });
    } catch (e) {}
    // waiting list update
    updateUserList();
  }
}

/// 리스트 타일 요소(첫번째 화면)
class EmpListTile extends StatelessWidget {
  late int userId;
  late String userName;
  late int userAge;
  late String userClass;
  Function? updateList;

  EmpListTile(
      int id, String name, int age, String userClass, Function? updateList)
      : this.userId = id,
        this.userName = name,
        this.userAge = age,
        this.userClass = userClass,
        this.updateList = updateList;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: getFullScrennSizePercent(
                          context, manageEmpPage_page1_tileNameWidth),
                      child: Text(userName),
                      padding: EdgeInsets.only(
                          left: manageEmpPage_listTileTextPadding,
                          top: manageEmpPage_listTilePadding,
                          bottom: manageEmpPage_listTilePadding),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 0,
                    ),
                    Container(
                      width: getFullScrennSizePercent(
                          context, manageEmpPage_page1_tileAgeWidth),
                      child: Text("Age: $userAge"),
                      padding: EdgeInsets.only(
                          left: manageEmpPage_listTileTextPadding,
                          top: manageEmpPage_listTilePadding,
                          bottom: manageEmpPage_listTilePadding),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 0,
                    ),
                    Container(
                      width: getFullScrennSizePercent(
                          context, manageEmpPage_page1_tileRoleWidth),
                      child: Text(userClass),
                      padding: EdgeInsets.only(
                          left: manageEmpPage_listTileTextPadding,
                          top: manageEmpPage_listTilePadding,
                          bottom: manageEmpPage_listTilePadding),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(themaColor_whiteBlack),
                height: 0,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
                  context,
                  Transition(
                      child: ViewEmpInfoPage(this.userId),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
              .then((value) => updateList!());
        },
      );
}

/// 리스트 타일 요소(두번째 화면)
class WaiteListTile extends StatelessWidget {
  late int userId;
  late String userName;
  late int userAge;
  Function? updateList;

  WaiteListTile(int id, String name, int age, Function? updateList)
      : this.userId = id,
        this.userName = name,
        this.userAge = age,
        this.updateList = updateList;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: getFullScrennSizePercent(
                          context, manageEmpPage_page2_tileNameWidth),
                      child: Text(userName),
                      padding: EdgeInsets.only(
                          left: manageEmpPage_listTileTextPadding,
                          top: manageEmpPage_listTilePadding,
                          bottom: manageEmpPage_listTilePadding),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 0,
                    ),
                    Container(
                      width: getFullScrennSizePercent(
                          context, manageEmpPage_page2_tileAgeWidth),
                      child: Text("Age: $userAge"),
                      padding: EdgeInsets.only(
                          left: manageEmpPage_listTileTextPadding,
                          top: manageEmpPage_listTilePadding,
                          bottom: manageEmpPage_listTilePadding),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(themaColor_whiteBlack),
                height: 0,
              ),
            ],
          ),
        ),
        onTap: () {
          showDialog(
                  context: context,
                  builder: (context) =>
                      ViewWaiteInfoDialog(userId, userName, userAge))
              .then((value) => updateList!());
        },
      );
}
