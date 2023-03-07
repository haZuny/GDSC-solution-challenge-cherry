import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class HelmetCheckPage extends StatefulWidget {
  @override
  State<HelmetCheckPage> createState() => _HelmetCheckPage();
}

class _HelmetCheckPage extends State<HelmetCheckPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarEmp(),
          drawer: DrawerEmp(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 로고 이미지
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    height: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    decoration:
                        BoxDecoration(color: Color(themaColor_white), boxShadow: [
                      BoxShadow(
                          blurRadius: allPage_shadowBlurRadius,
                          offset:
                              Offset(allPage_shadowOffSet, allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                    child: Image.asset(
                      'assets/img/logo.png',
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                    ),
                  ),

                  /// check 버튼
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Unchecked",
                        style: TextStyle(
                            fontSize: putCheckCodePage_checkBtnFontSize,
                            fontWeight: FontWeight.w500,
                            color: Color(allPage_btnSubFontColor)),
                      ),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, helmetCheckPage_spacePerNextBtn),
                  ),

                  /// next 버튼
                  TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        "Next",
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
}
