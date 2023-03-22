import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'Dialog.dart';
import 'All_HomePage.dart';

class CheckListPage extends StatefulWidget {
  @override
  State<CheckListPage> createState() => _CheckListPage();
}

class _CheckListPage extends State<CheckListPage> {
  List<CheckListTile> checkList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateCheckList(global_siteId);
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
                      context, Transition(child: HomePageAll(), ), (_) => false);
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
                    "Check the list",
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
                        context, checkListPage_spacePerSubTitle),
                  ),

                  /// 체크 영역
                  Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      height: getFullScrennSizePercent(
                          context, checkListPage_checkFormHeight),
                      decoration: BoxDecoration(
                          color: Color(themaColor_white),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: allPage_shadowBlurRadius,
                                offset: Offset(
                                    allPage_shadowOffSet, allPage_shadowOffSet),
                                color: Color(themaColor_whiteBlack))
                          ],
                          borderRadius:
                              BorderRadius.circular(allPage_bigBoxRadious),
                          border: Border.all(
                              color: Color(themaColor_yellow),
                              width: allPage_BigSpaceWidth)),

                      /// 리스트 타일
                      child: ListView.builder(
                        itemBuilder: (context, idx) => checkList[idx],
                        itemCount: checkList.length,
                      )),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, checkListPage_spacePerBackBtn),
                  ),

                  /// Add 버튼
                  if (global_userRole != enum_Role.user)
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                                context: context,
                                builder: (context) =>
                                    AddCheckListDialog(true, updateCheckList));
                      },
                      // 내부 컴포넌트
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 텍스트
                          Text(
                            "Add",
                            style: TextStyle(color: Color(themaColor_yellow),
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
                            borderRadius: BorderRadius.circular(
                                allPage_roundBtnRadius),
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

  // 리스트 업데이트
  Future<void> updateCheckList(int siteId) async {
    setState(() {
      checkList.clear();
    });

    late Response res;
    try {
      res = await api_siteCheck_getCheckList(siteId);
      List checks = res.data['data'];
      for (Map tile in checks) {
        setState(() {
          checkList.add(CheckListTile(tile['checkId'], tile['siteQuestion'],
              tile['siteAnswer'], this.updateCheckList));
        });
      }
    } catch (e) {}
  }
}

/// 리스트 타일 요소
class CheckListTile extends StatefulWidget {
  late int checkId;
  late String checkMSG;
  late bool checkState;
  late Function updateState;

  CheckListTile(int id, String msg, bool state, Function updateState)
      : this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

  @override
  State<CheckListTile> createState() =>
      _CheckListTile(checkId, checkMSG, checkState, updateState);
}

class _CheckListTile extends State<CheckListTile> {
  late int checkId;
  late String checkMSG;
  late bool checkState;
  late Function updateState;

  _CheckListTile(int id, String msg, bool state, Function updateState)
      : this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(
              left: checkListPage_listTilePaddingLeft,
              right: checkListPage_listTilePaddingLeft),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    checkMSG,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: allPage_subTitleFontSize),
                    overflow: TextOverflow.ellipsis,
                  )),
                  Checkbox(
                      activeColor: Color(themaColor_yellow),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(themaColor_yellow)),
                      value: checkState,
                      onChanged: (val) async {
                        if (global_userRole != enum_Role.user) {
                          late Response res;
                          try {
                            res = await api_siteCheck_editAnswer(checkId, val!);
                            setState(() {
                              checkState = val;
                            });
                          } catch (e) {}
                        }
                      }),
                ],
              ),
              Divider(
                color: Color(themaColor_whiteBlack),
                height: 0,
              ),
              // 간격
              Container(
                height: checkListPage_listTilePaddingTopBottom,
              )
            ],
          ),
        ),

        /// 전체 글자 다이얼로그
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => ViewCheckListInfoDialog(
                  checkId, checkMSG, checkState, updateState));
        },
      );
}
