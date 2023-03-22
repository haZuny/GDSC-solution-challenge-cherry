import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:cherry_app/baseFile.dart';

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
            borderRadius: BorderRadius.circular(dialog_dialogRound)),
        // 메인 타이틀
        titlePadding: EdgeInsets.zero,
        title: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(themaColor_whiteYellow),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dialog_dialogRound),
                    topRight: Radius.circular(dialog_dialogRound))),
            child: Text("Detail")),
        // 내용
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: "Name: ",
                    style: TextStyle(
                        fontSize: dialog_fontSize,
                        color: Color(themaColor_black),
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: userName,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: "\nAge:\t\t",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: userAge.toString(),
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ])),
          ],
        ),

        /// 버튼
        actionsAlignment: MainAxisAlignment.end,
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
                style: TextStyle(color: Color(allPage_btnFontColor)),
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
                style: TextStyle(color: Color(allPage_btnSubFontColor)),
              )),
        ],
      );
}

/// 체크리스트 자세히 보기
class ViewCheckListInfoDialog extends StatefulWidget {
  late int checkId;
  late String checkMSG;
  late bool checkState;
  final updateState;

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
  final updateState;

  _ViewCheckListInfoDialog(int id, String msg, bool state, Function updateState)
      : this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

  @override
  Widget build(BuildContext context) => AlertDialog(
        // 둥글기
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialog_dialogRound)),
        // 메인 타이틀
        titlePadding: EdgeInsets.zero,
        title: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(themaColor_whiteYellow),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dialog_dialogRound),
                    topRight: Radius.circular(dialog_dialogRound))),
            child: Text("Detail")),
        // 내용
        content: Text(
          checkMSG,
          style: TextStyle(fontSize: dialog_fontSize),
        ),

        /// 버튼
        actionsAlignment: MainAxisAlignment.end,
        actions: <Widget>[
          // 삭제
          if (global_userRole != enum_Role.user)
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
                  ),
                )),

          // 수정
          if (global_userRole != enum_Role.user)
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) => AddCheckListDialog(
                            false,
                            updateState,
                            id: checkId,
                            msg: checkMSG,
                            state: checkState,
                          ));
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Color(allPage_btnFontColor),
                  ),
                )),

          // 완료
          if (global_userRole == enum_Role.user)
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Color(allPage_btnFontColor),
                  ),
                )),
        ],
      );
}

/// 메니저 체크리스트 추가/수정
class AddCheckListDialog extends StatefulWidget {
  late bool isAdd;
  final updateState;
  late int? checkId;
  late String? checkMSG;
  late bool? checkState;

  AddCheckListDialog(bool isAdd, Function updateState,
      {int? id, String? msg, bool? state})
      : this.isAdd = isAdd,
        this.updateState = updateState,
        this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state;

  @override
  State<AddCheckListDialog> createState() =>
      _AddCheckListDialog(isAdd, checkId, checkMSG, checkState, updateState);
}

class _AddCheckListDialog extends State<AddCheckListDialog> {
  TextEditingController _textController = TextEditingController();

  late bool isAdd;
  late int? checkId;
  late String? checkMSG;
  late bool? checkState;
  final updateState;

  _AddCheckListDialog(
      bool isAdd, int? id, String? msg, bool? state, Function updateState)
      : this.isAdd = isAdd,
        this.checkId = id,
        this.checkMSG = msg,
        this.checkState = state,
        this.updateState = updateState;

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
            borderRadius: BorderRadius.circular(dialog_dialogRound)),
        // 메인 타이틀
        titlePadding: EdgeInsets.zero,
        title: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(themaColor_whiteYellow),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dialog_dialogRound),
                    topRight: Radius.circular(dialog_dialogRound))),
            child: Text("Input")),
        // Content
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
        actionsAlignment: MainAxisAlignment.end,
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
                    updateState(global_siteId);
                    Navigator.pop(context);
                  } catch (e) {}
                }
                // 수정
                else {
                  late Response res;
                  try {
                    res = await api_siteCheck_editCheckList(checkId!, text);
                    updateState(global_siteId);
                    Navigator.pop(context);
                  } catch (e) {}
                }
              },
              child: Text(
                "Done",
                style: TextStyle(color: Color(allPage_btnFontColor)),
              )),
        ],
      );
}
