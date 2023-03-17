import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class ViewWaiteInfoPage extends StatefulWidget {
  @override
  State<ViewWaiteInfoPage> createState() => _ViewWaiteInfoPage();
}

class _ViewWaiteInfoPage extends State<ViewWaiteInfoPage> {
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
              /// 이름, 등급
              Text(
                "Hajun Kwon / Employee",
                style: TextStyle(fontSize: viewPeopleInfoPage_fontSize, fontWeight: FontWeight.bold),
              ),

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, viewPeopleInfoPage_spacePerText),
              ),

              /// 나이
              Text(
                "24 years old",
                style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
              ),

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, viewPeopleInfoPage_spacePerText),
              ),

              /// 이메일
              Text(
                "hj3175791@gmail.com",
                style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
              ),

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, viewPeopleInfoPage_spacePerText),
              ),

              /// 전화번호
              Text(
                "010-3809-5791",
                style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
              ),

              /// 간격
              Container(
                height: getFullScrennSizePercent(
                    context, viewPeopleInfoPage_spacePerBottomBtn),
              ),

              /// 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 승인
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Kick out",
                        style: TextStyle(
                            color: Color(allPage_btnFontColor), fontSize: allPage_btnFontSize),
                      )),
                  // 간격
                  Container(
                    width: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerBtns),
                  ),

                  // 내쫒기
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Kick out",
                        style: TextStyle(
                            color: Color(allPage_btnSubFontColor), fontSize: allPage_btnFontSize),
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
