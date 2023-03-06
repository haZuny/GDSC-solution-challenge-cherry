import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class SiteInfoPageManager extends StatefulWidget {
  @override
  State<SiteInfoPageManager> createState() => _SiteInfoPageManager();
}

class _SiteInfoPageManager extends State<SiteInfoPageManager> {
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
                  /// 타이틀
                  Text(
                    "현장 이름",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, siteInfoPage_spacePerTitle),
                  ),

                  /// 현장 코드
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Text("-",
                          style: TextStyle(
                              fontSize: siteInfoPage_codeFontSize,
                              fontWeight: FontWeight.bold)),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text("A",
                              style: TextStyle(
                                  fontSize: siteInfoPage_codeFontSize))),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: getFullScrennSizePercent(
                              context, siteInfoPage_codeWidth),
                          height: getFullScrennSizePercent(
                              context, siteInfoPage_codeHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius:
                                        siteInfoPage_codeShadowBlurRadius,
                                    offset: Offset(
                                        siteInfoPage_codeShadowOffSer,
                                        siteInfoPage_codeShadowOffSer),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius: BorderRadius.circular(
                                  siteInfoPage_codeRadius)),
                          child: Text(
                            "A",
                            style:
                                TextStyle(fontSize: siteInfoPage_codeFontSize),
                          )),
                      Container(
                        width: getFullScrennSizePercent(
                            context, siteInfoPage_spacePerCode),
                      ),
                    ],
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, siteInfoPage_spacePerTitle),
                  ),

                  /// 로고 이미지
                  Container(
                    width: getFullScrennSizePercent(
                        context, siteInfoPage_mapWidth),
                    height: getFullScrennSizePercent(
                        context, siteInfoPage_mapHeight),
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
                    child: Image.asset(
                      'assets/img/logo.png',
                      width: getFullScrennSizePercent(
                          context, helmetCheckPage_imgWidth),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
