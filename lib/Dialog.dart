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
                try{
                  res = await api_admin_deleteUser(userId);
                  Navigator.pop(context);
                }catch(e){}
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
