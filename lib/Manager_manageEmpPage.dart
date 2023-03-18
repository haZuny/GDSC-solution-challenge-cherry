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
    updateUserList();
    // 승인 요청 리스트 조회
    updateWaitingList();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerManager(),
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
                      color: Color(allPage_btnFontColor),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor)),
              _currentPage == 1
                  ? Icon(
                      Icons.radio_button_checked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor)),
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
                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_spaceTopBottom),
                      ),

                      /// 타이틀
                      Text(
                        "Checked",
                        style: TextStyle(fontSize: allPage_titleFontSize),
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
                              context, manageEmpPage_page1_checkedFoemHeight),
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
                        "Unchecked",
                        style: TextStyle(
                          fontSize: allPage_titleFontSize,
                        ),
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
                              context, manageEmpPage_page1_uncheckedFoemHeight),
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
                            context, manageEmpPage_spaceTopBottom),
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
                      /// 타이틀
                      Text(
                        "Waiting List",
                        style: TextStyle(fontSize: allPage_titleFontSize),
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
      List checkedList = res.data['data']['checked'];
      List uncheckedList = res.data['data']['unchecked'];

      setState(() {
        // checked update
        for (Map user in checkedList) {
          _checkedUserList.add(EmpListTile(user['id'], user['userName'],
              user['userAge'], user['role'], updateUserList));
        }
        // unchecked update
        for (Map user in uncheckedList) {
          _uncheckedUserList.add(EmpListTile(user['id'], user['userName'],
              user['userAge'], user['role'], updateUserList));
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
              Padding(
                padding: EdgeInsets.all(manageEmpPage_listTilePadding),
                child: Text(
                  "$userName / $userAge / $userClass",
                  style: TextStyle(fontSize: manageEmpPage_listTextFontSize),
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
                  transitionEffect: TransitionEffect.RIGHT_TO_LEFT)).then((value) => updateList!());
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
              Padding(
                padding: EdgeInsets.all(manageEmpPage_listTilePadding),
                child: Text(
                  "$userName / $userAge",
                  style: TextStyle(fontSize: manageEmpPage_listTextFontSize),
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
