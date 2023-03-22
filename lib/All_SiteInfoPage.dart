import 'dart:typed_data';

import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transition/transition.dart';
import 'dart:ui' as ui;
import 'All_HomePage.dart';

class SiteInfoPageAll extends StatefulWidget {
  @override
  State<SiteInfoPageAll> createState() => _SiteInfoPageAll();
}

class _SiteInfoPageAll extends State<SiteInfoPageAll> {
  GoogleMapController? _googleMapController;

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
                  Navigator.pushAndRemoveUntil(
                      context, Transition(child: HomePageAll()), (_) => false);
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
                  /// 공간
                  Container(
                    height:
                        getFullScrennSizePercent(context, allPage_spaceTopDown),
                  ),

                  /// 타이틀
                  Text(
                    global_siteName,
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
                      // color: Color(themaColor_yellow),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// 타이틀과 서브타이틀 사이 공간
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
                      "C H E R R Y",
                      style: TextStyle(
                        color: Color(themaColor_white),
                        fontSize: allPage_subTitleFontSize,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(themaColor_yellow),
                        borderRadius:
                            BorderRadius.circular(allPage_subTitleLineRadius)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                                  siteInfoPage_codeRadius),
                              border: Border.all(
                                  color: Color(themaColor_yellow),
                                  width: siteInfoPage_codeBoxWidth)),
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
                        border: Border.all(
                            color: Color(themaColor_yellow),
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
                                _googleMapController?.moveCamera(
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
