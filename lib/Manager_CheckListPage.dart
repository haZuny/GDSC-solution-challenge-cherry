import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Dialog.dart';

class CheckListPageManager extends StatefulWidget {
  @override
  State<CheckListPageManager> createState() => _CheckListPageManager();
}

class _CheckListPageManager extends State<CheckListPageManager> {
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
          drawer: DrawerEmp(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 타이틀
                  Text(
                    "Check today's safety",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
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
                              BorderRadius.circular(allPage_bigBoxRadious)),
                      child: ListView.builder(
                        itemBuilder: (context, idx) => checkList[idx],
                        itemCount: checkList.length,
                      )),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, checkListPage_spacePerBackBtn),
                  ),

                  /// ADD 버튼
                  TextButton(
                      onPressed: () {
                        showDialog(
                                context: context,
                                builder: (context) => AddCheckListDialog(true))
                            .then((value) {
                          updateCheckList(global_siteId);
                        });
                      },
                      child: Text(
                        "Add",
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

  // 리스트 업데이트
  Future<void> updateCheckList(int siteId) async {
    checkList.clear();

    late Response res;
    try {
      res = await api_siteCheck_getCheckList(siteId);
      List checks = res.data['data'];
      setState(() {
        for (Map tile in checks) {
          checkList.add(CheckListTile(tile['checkId'], tile['siteQuestion'],
              tile['siteAnswer'], updateCheckList));
        }
      });
    } catch (e) {
      print(e);
    }
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  checkMSG,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: allPage_subTitleFontSize),
                )),
                Checkbox(
                  activeColor: Color(themaColor_black),
                    value: checkState,
                    onChanged: (val) async {
                      late Response res;
                      try {
                        res = await api_siteCheck_editAnswer(checkId, val!);
                        setState(() {
                          checkState = val;
                        });
                      } catch (e) {}
                    }),
                // 간격
                Container(
                  width: checkListPage_listTilePaddingLeft,
                ),
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

        /// 전체 글자 다이얼로그
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => ViewCheckListInfoDialog(
                  checkId, checkMSG, checkState, updateState));
        },
      );
}
