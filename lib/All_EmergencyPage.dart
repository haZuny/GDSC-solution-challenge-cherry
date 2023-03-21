import 'dart:typed_data';

import 'package:cherry_app/All_CPR_Page.dart';
import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:transition/transition.dart';

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
          drawer:
          global_userRole == enum_Role.user ? DrawerEmp() : DrawerManager(),

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
              onPressed: () {},
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
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            Transition(
                                child: CPRPage(),
                                transitionEffect:
                                    TransitionEffect.RIGHT_TO_LEFT));
                      },
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
