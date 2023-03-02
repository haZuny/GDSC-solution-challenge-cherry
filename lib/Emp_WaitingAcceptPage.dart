import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

import 'AppBar_Drawer.dart';
import 'Emp_homePage.dart';

class WaitingAcceptPage extends StatefulWidget {
  @override
  State<WaitingAcceptPage> createState() => _WaitingAcceptPage();
}

class _WaitingAcceptPage extends State<WaitingAcceptPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
    },
    child: Scaffold(
      appBar: AppBarNone(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 타이틀
            Text(
              "Waiting accept",
              style: TextStyle(fontSize: allPage_titleFontSize),
            ),
            

            /// 간격
            Container(
              height: getFullScrennSizePercent(
                  context, waitingAcceptPage_spacePerNextBtn, false),
            ),

            /// Re-type 버튼
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageEmp()));
                },
                child: Text(
                  "Re-type",
                  style: TextStyle(
                      fontSize: allPage_btnFontSize,
                      color: Color(allPage_btnFontColor)),
                ))
          ],
        ),
      ),
    ),
  );
}
