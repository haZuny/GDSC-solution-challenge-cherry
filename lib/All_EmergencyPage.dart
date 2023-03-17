import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Emp_CheckListPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/// 구글맵 컨트롤러
late GoogleMapController _googleMapController;

class EmergencyPage extends StatefulWidget {
  @override
  State<EmergencyPage> createState() => _EmergencyPage();
}

class _EmergencyPage extends State<EmergencyPage> {
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
                  /// 타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: Text(
                      "Near casualty.",
                      style: TextStyle(fontSize: allPage_titleFontSize),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerTitle),
                  ),

                  /// 지도
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    height: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
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
                      initialCameraPosition:
                          CameraPosition(target: LatLng(global_siteLat, global_siteLon), zoom: 15),
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerMap),
                  ),

                  /// CPR 버튼
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "CPR manual",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerTextBtn),
                  ),

                  /// 지혈 방법 버튼
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Hemostatic method",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerTextBtn),
                  ),

                  /// 부러졌을때 매뉴얼 버튼
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "When fractured",
                        style: TextStyle(
                            fontSize: allPage_btnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
}
