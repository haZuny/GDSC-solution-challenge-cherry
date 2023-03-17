import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SiteInfoPageAll extends StatefulWidget {
  @override
  State<SiteInfoPageAll> createState() => _SiteInfoPageAll();
}

class _SiteInfoPageAll extends State<SiteInfoPageAll> {
  GoogleMapController? _googleMapController;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: global_signUpClass == enum_Role.employee
              ? DrawerEmp()
              : DrawerManager(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 타이틀
                  Text(
                    global_siteName,
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
                          child: Text(global_siteCode[0],
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
                          child: Text(global_siteCode[1],
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
                          child: Text(global_siteCode[2],
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
                          child: Text(global_siteCode[3],
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
                          child: Text(global_siteCode[4],
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
                          child: Text(global_siteCode[5],
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
                          child: Text(global_siteCode[6],
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
                            global_siteCode[7],
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

                  /// 지도
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
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
                    child: GoogleMap(
                      onMapCreated: (controller) async {
                        _googleMapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                          target: LatLng(global_siteLat, global_siteLon), zoom: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
