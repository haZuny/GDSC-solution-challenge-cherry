import 'dart:typed_data';

import 'package:cherry_app/All_CPR_Page.dart';
import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:transition/transition.dart';

import 'Emp_HomePage.dart';
import 'Manager_HomePage.dart';

class EmergencyPage extends StatefulWidget {
  @override
  State<EmergencyPage> createState() => _EmergencyPage();
}

class _EmergencyPage extends State<EmergencyPage> {
  /// 구글맵 컨트롤러
  late GoogleMapController _googleMapController;

  /// 현장 마커
  BitmapDescriptor marker_site = BitmapDescriptor.defaultMarker;

  /// 마커 이미지 비트맵 전환
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  /// 비트맵 이미지 마커로 전환
  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBitmapDescriptorFromAssetBytes("assets/img/marker_mint.png", 100)
        .then((value) {
      setState(() => marker_site = value);
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerAll(),

          /// bottom bar
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height:
                  getFullScrennSizePercent(context, bottomBar_bottomBarHeight),
            ),
            shape: CircularNotchedRectangle(),
            color: Color(themaColor_white),
            notchMargin:
                getFullScrennSizePercent(context, bottomBar_bottomBarNorch),
          ),

          /// floating btn
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
                bottom: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnMargin)),
            child: FloatingActionButton(
              child: Icon(
                Icons.home,
                size: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnSize),
              ),
              backgroundColor: Color(themaColor_yellow),
              onPressed: () {
                if (global_userRole == enum_Role.user)
                  Navigator.pushAndRemoveUntil(
                      context, Transition(child: HomePageEmp()), (_) => false);
                else
                  Navigator.pushAndRemoveUntil(context,
                      Transition(child: HomePageManager()), (_) => false);
              },
            ),
          ),

          /// floating btn location
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          /// body
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 위, 아래 공간
                  Container(
                    height:
                    getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),
                  /// 타이틀
                  Text(
                    "Emergency",
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
                      // color: Color(themaColor_yellow),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// 타이틀과 서브타이틀
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndSubTitme),
                  ),

                  /// 서브타이틀
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    alignment: Alignment.center,
                    child: Text(
                      "Nearby hospital",
                      style: TextStyle(
                        color: Color(themaColor_white),
                        fontSize: allPage_subTitleFontSize,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(allPage_btnSubFontColor),
                        borderRadius:
                            BorderRadius.circular(allPage_subTitleLineRadius)),
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
                        border: Border.all(
                            color: Color(allPage_btnSubFontColor),
                            width: allPage_BigSpaceWidth)),
                    child: Stack(
                      children: [
                        // 지도 본체
                        GoogleMap(
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          onMapCreated: (controller) async {
                            _googleMapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                              target: LatLng(global_siteLat, global_siteLon),
                              zoom: 15),
                          markers: [
                            Marker(
                              markerId: const MarkerId("marker1"),
                              position: LatLng(global_siteLat, global_siteLon),
                              icon: marker_site,
                              onDragEnd: (value) {
                                // value는 새 위치입니다.
                              },
                            ),
                          ].toSet(),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.explore_outlined,
                                size: getFullScrennSizePercent(
                                    context, googleMap_iconSize),
                                color: Color(themaColor_whiteBlack),
                              ),
                              // 초기 위치 이동
                              onPressed: () {
                                _googleMapController.moveCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: LatLng(
                                                global_siteLat, global_siteLon),
                                            zoom: 15)));
                              },
                            ))
                      ],
                    ),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerMap),
                  ),

                  /// CPR 버튼
                  if (global_userRole != enum_Role.user)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            Transition(
                                child: CPRPage(),
                                transitionEffect:
                                    TransitionEffect.RIGHT_TO_LEFT));
                      },
                      // 내부 컴포넌트
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 텍스트
                          Text(
                            "CPR",
                            style: TextStyle(
                                color: Color(allPage_btnSubFontColor),
                                fontSize: allPage_roundBtnFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          // 크기 설정
                          minimumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          maximumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          // 모양 및 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(allPage_roundBtnRadius),
                            side: BorderSide(
                                color: Color(allPage_btnSubFontColor),
                                width: allPage_addBtnWidth),
                          ),

                          // 배경 색상 설정
                          backgroundColor: Color(themaColor_white),
                          // 그림자 투명도
                          elevation: 5),
                    ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, emergencyPage_spacePerBtn),
                  ),

                  /// 지혈 버튼
                  if (global_userRole != enum_Role.user)
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     Transition(
                        //         child: CPRPage(),
                        //         transitionEffect:
                        //             TransitionEffect.RIGHT_TO_LEFT));
                      },
                      // 내부 컴포넌트
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 텍스트
                          Text(
                            "Homostasis",
                            style: TextStyle(
                                color: Color(allPage_btnSubFontColor),
                                fontSize: allPage_roundBtnFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          // 크기 설정
                          minimumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          maximumSize: Size(
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnWidth),
                              getFullScrennSizePercent(
                                  context, allPage_roundBtnHeight)),
                          // 모양 및 테두리 설정
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(allPage_roundBtnRadius),
                            side: BorderSide(
                                color: Color(allPage_btnSubFontColor),
                                width: allPage_addBtnWidth),
                          ),

                          // 배경 색상 설정
                          backgroundColor: Color(themaColor_white),
                          // 그림자 투명도
                          elevation: 5),
                    ),

                  /// 위, 아래 공간
                  Container(
                    height:
                    getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
