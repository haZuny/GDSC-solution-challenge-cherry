import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';
import 'Emp_HomePage.dart';

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, waitingAcceptPage_spacePerNextBtn),
              ),

              /// 타이틀
              Text(
                "Waiting accept",
                style: TextStyle(fontSize: allPage_titleFontSize),
              ),


              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, waitingAcceptPage_spacePerNextBtn),
              ),

              /// Re-type 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Back 버튼
                  TextButton(
                      onPressed: () {
                        global_googleSignIn?.signOut();
                        api_user_logout();
                        print(">>> Google SignOut");
                        Navigator.pushReplacement(
                            context, Transition(child: SignInPage()));
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),

                  // 간격
                  Container(
                      width: getFullScrennSizePercent(
                          context, waitingAcceptPage_spaceBottomBtn)),


                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageEmp()));
                      },
                      child: Text(
                        "Re-type",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
