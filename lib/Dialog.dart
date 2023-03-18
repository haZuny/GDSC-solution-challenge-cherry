import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

/// 메니저 승인 대기 목록 조회
class ViewWaiteInfoDialog extends StatefulWidget {
  late int userId;
  late String userName;
  late int userAge;

  ViewWaiteInfoDialog(int id, String name, int age)
      : this.userId = id,
        this.userName = name,
        this.userAge = age;

  @override
  State<ViewWaiteInfoDialog> createState() =>
      _ViewWaiteInfoDialog(userId, userName, userAge);
}

class _ViewWaiteInfoDialog extends State<ViewWaiteInfoDialog> {
  late int userId;
  late String userName;
  late int userAge;

  _ViewWaiteInfoDialog(int id, String name, int age)
      : this.userId = id,
        this.userName = name,
        this.userAge = age;

  @override
  Widget build(BuildContext context) => AlertDialog(
        // 둥글기
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(viewWaitingListDialog_dialogRound)),
        // 메인 타이틀
        title: Column(
          children: <Widget>[
            new Text("Waiting User"),
          ],
        ),
        // 내용
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// 이름
            Text(
              userName,
              style: TextStyle(fontSize: viewWaitingListDialog_fontSize),
            ),

            /// 간격
            Container(
              height: getFullScrennSizePercent(
                  context, viewWaitingListDialog_spacePerText),
            ),

            /// 나이
            Text(
              "$userAge years old",
              style: TextStyle(fontSize: viewWaitingListDialog_fontSize),
            ),
          ],
        ),

        /// 버튼
        actions: <Widget>[
          // 승인
          TextButton(
              onPressed: () async {
                late Response res;
                try {
                  res = await api_admin_acceptWaiting(userId);
                  Navigator.pop(context);
                } catch (e) {}
              },
              child: Text(
                "Accept",
                style: TextStyle(
                    color: Color(allPage_btnFontColor),
                    fontSize: allPage_btnFontSize),
              )),

          // 내쫒기
          TextButton(
              onPressed: () async {
                late Response res;
                try {
                  res = await api_admin_deleteUser(userId);
                  Navigator.pop(context);
                } catch (e) {}
              },
              child: Text(
                "Delete",
                style: TextStyle(
                    color: Color(allPage_btnSubFontColor),
                    fontSize: allPage_btnFontSize),
              )),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
}

/// 메니저 체크리스트 자세히 보기
class ViewCheckListInfoDialog extends StatefulWidget {
  late int checkId;
  late String checkMSG;
  late bool checkState;
  late Function updateState;

  ViewCheckListInfoDialog(int id, String msg, bool state, Function updateState)
      : this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

  @override
  State<ViewCheckListInfoDialog> createState() =>
      _ViewCheckListInfoDialog(checkId, checkMSG, checkState, updateState);
}

class _ViewCheckListInfoDialog extends State<ViewCheckListInfoDialog> {
  late int checkId;
  late String checkMSG;
  late bool checkState;
  late Function updateState;

  _ViewCheckListInfoDialog(int id, String msg, bool state, Function updateState)
      : this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

  @override
  Widget build(BuildContext context) => AlertDialog(
        // 둥글기
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(viewWaitingListDialog_dialogRound)),
        // 메인 타이틀
        title: Column(
          children: <Widget>[
            new Text("Check List"),
          ],
        ),
        // 내용
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// 메시지
            Text(
              checkMSG,
              style: TextStyle(fontSize: viewWaitingListDialog_fontSize),
            ),

            /// 간격
            Container(
              height: getFullScrennSizePercent(
                  context, viewWaitingListDialog_spacePerText),
            ),
          ],
        ),

        /// 버튼
        actions: <Widget>[
          // 수정
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => AddCheckListDialog(
                          false,
                          id: checkId,
                          msg: checkMSG,
                          state: checkState,
                        )).then((value) => this.updateState(global_siteId));
              },
              child: Text(
                "Edit",
                style: TextStyle(
                    color: Color(allPage_btnFontColor),
                    fontSize: allPage_btnFontSize),
              )),

          // 삭제
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                late Response res;
                try {
                  res = await api_siteCheck_deleteCheckList(checkId);
                  updateState(global_siteId);
                } catch (e) {}
              },
              child: Text(
                "Delete",
                style: TextStyle(
                    color: Color(allPage_btnSubFontColor),
                    fontSize: allPage_btnFontSize),
              )),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
}

/// 메니저 체크리스트 추가/수정
class AddCheckListDialog extends StatefulWidget {
  late bool isAdd;
  late int? checkId;
  late String? checkMSG;
  late bool? checkState;

  AddCheckListDialog(bool isAdd, {int? id, String? msg, bool? state})
      : this.isAdd = isAdd,
        this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state;

  @override
  State<AddCheckListDialog> createState() =>
      _AddCheckListDialog(isAdd, checkId, checkMSG, checkState);
}

class _AddCheckListDialog extends State<AddCheckListDialog> {
  TextEditingController _textController = TextEditingController();

  late bool isAdd;
  late int? checkId;
  late String? checkMSG;
  late bool? checkState;

  _AddCheckListDialog(bool isAdd, int? id, String? msg, bool? state)
      : this.isAdd = isAdd,
        this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!isAdd) {
      _textController.text = checkMSG!;
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        // 둥글기
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(viewWaitingListDialog_dialogRound)),
        // 메인 타이틀
        title: Column(
          children: <Widget>[
            new Text("Check List"),
          ],
        ),
        content: Builder(builder: (context) {
          return Container(
            width:
                getFullScrennSizePercent(context, allPage_mainComponentsWidth),
            // 내용
            child: TextField(
              controller: _textController,
            ),
          );
        }),

        /// 버튼
        actions: <Widget>[
          // 완료
          TextButton(
              onPressed: () async {
                String text = _textController.text;
                late Response res;
                // 생성
                if (isAdd) {
                  late Response res;
                  try {
                    res = await api_siteCheck_addCheckList(global_siteId, text);
                  Navigator.pop(context);
                  } catch (e) {}
                }
                // 수정
                else {
                  late Response res;
                  try {
                    res = await api_siteCheck_editCheckList(checkId!, text);
                    Navigator.pop(context);
                  } catch (e) {}
                }
              },
              child: Text(
                "Done",
                style: TextStyle(
                    color: Color(allPage_btnFontColor),
                    fontSize: allPage_btnFontSize),
              )),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
}
