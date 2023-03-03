import 'package:cherry_app/AppBar_Drawer.dart';
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// 로고 이미지
                Container(
                  width: getFullScrennSizePercent(
                      context, helmetCheckPage_imgWidth, true),
                  height: getFullScrennSizePercent(
                      context, helmetCheckPage_imgWidth, true),
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
                        context, helmetCheckPage_imgWidth, true),
                  ),
                ),

                /// check 버튼
                Container(
                  width: getFullScrennSizePercent(
                      context, allPage_signUpTFWidth, true),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Check",
                        style: TextStyle(
                            fontSize: putCheckCodePage_checkBtnFontSize,
                            color: Color(allPage_btnSubFontColor)),
                      )),
                ),

                /// 간격
                Container(
                  height: getFullScrennSizePercent(
                      context, helmetCheckPage_spacePerNextBtn, false),
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
      );
}
