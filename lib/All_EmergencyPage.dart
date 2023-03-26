import 'dart:convert' as convert;
import 'dart:typed_data';
import 'package:cherry_app/All_CPR_Page.dart';
import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:transition/transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xml2json/xml2json.dart';
import 'All_HomePage.dart';

class EmergencyPage extends StatefulWidget {
  @override
  State<EmergencyPage> createState() => _EmergencyPage();
}

class _EmergencyPage extends State<EmergencyPage> {
  /// 구글맵 컨트롤러
  late GoogleMapController _googleMapController;

  /// 주변 병원, 마커 리스트
  List<EmergencyMarker> emergencyList = [];
  List<Marker> markerList = [];

  /// 현장 마커 이미지
  BitmapDescriptor marker_site = BitmapDescriptor.defaultMarker;
  BitmapDescriptor marker_emer = BitmapDescriptor.defaultMarker;

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
    // 마커 이미지 변환
    getBitmapDescriptorFromAssetBytes("assets/img/marker_mint.png", 100)
        .then((value) {
      setState(() => marker_site = value);
      // 현장 마커 추가
      markerList.add(
        Marker(
            markerId: const MarkerId("marker1"),
            position: LatLng(global_siteLat, global_siteLon),
            icon: marker_site,
            draggable: false),
      );
    });
    getBitmapDescriptorFromAssetBytes("assets/img/marker_brown.png", 100)
        .then((value) {
      setState(() => marker_emer = value);
      // 주변 병원 정보 받아옴
      getEmergencyAPI(global_siteAdd1, global_siteAdd2).then((value) {
        List lists = value['response']['body']['items']['item'];
        // 리스트에 추가
        for (var map in lists) {
          emergencyList.add(EmergencyMarker(
              map['dutyAddr'],
              map['dutyName'],
              map['dutyEmclsName'],
              map['dutyTel1'],
              map['dutyTel3'],
              double.parse(map['wgs84Lat']),
              double.parse(map['wgs84Lon'])));

          // 병원 마커 추가
          for (EmergencyMarker em in emergencyList) {
            setState(() {
              markerList.add(Marker(
                  markerId: MarkerId(em.name),
                  position: LatLng(em.lat, em.lon),
                  icon: marker_emer,
                  draggable: false,
                  onTap: () {
                    /// BottomSheet
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(allPage_bigBoxRadious),
                              topRight: Radius.circular(allPage_bigBoxRadious)),
                        ),
                        context: context,
                        builder: (context) => Container(
                              height: getFullScrennSizePercent(
                                  context, emergencyPage_btms_height),
                              padding:
                                  EdgeInsets.all(emergencyPage_btms_padding),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name: ${em.name}",
                                      style: TextStyle(
                                          fontSize: allPage_titleFontSize),
                                    ),
                                    Text(
                                      "Type: ${em.emclsName}",
                                      style: TextStyle(
                                          fontSize: allPage_subTitleFontSize,
                                          color: Color(themaColor_whiteBlack)),
                                    ),
                                    Divider(),
                                    Text(
                                      "Address: ${em.addr}",
                                      style: TextStyle(
                                        fontSize: allPage_subTitleFontSize,
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Tel1: ${em.tel1}",
                                            style: TextStyle(
                                              fontSize:
                                                  allPage_subTitleFontSize,
                                            )),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                launchUrl(Uri.parse(
                                                    "tel:${em.tel1.replaceAll(RegExp('\\D'), "")}"));
                                              },
                                              icon: Icon(
                                                Icons.call,
                                                color: Color(themaColor_red),
                                              )),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      allPage_btnRadius),
                                              border: Border.all(
                                                  color: Color(themaColor_red),
                                                  width: allPage_addBtnWidth)),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Tel2: ${em.tel3}",
                                            style: TextStyle(
                                              fontSize:
                                                  allPage_subTitleFontSize,
                                            )),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                launchUrl(Uri.parse(
                                                    "tel:${em.tel3.replaceAll(RegExp('\\D'), "")}"));
                                              },
                                              icon: Icon(
                                                Icons.call,
                                                color: Color(themaColor_red),
                                              )),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      allPage_btnRadius),
                                              border: Border.all(
                                                  color: Color(themaColor_red),
                                                  width: allPage_addBtnWidth)),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ));
                  }));
            });
          }
        }
      });
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
                      "N e a r b y - h o s p i t a l",
                      style: TextStyle(
                        color: Color(themaColor_white),
                        fontSize: allPage_subTitleFontSize,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(themaColor_red),
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
                            color: Color(themaColor_red),
                            width: allPage_BigSpaceWidth)),
                    child: Stack(
                      children: [
                        // 지도 본체
                        GoogleMap(
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: true,
                            onMapCreated: (controller) async {
                              _googleMapController = controller;
                            },
                            initialCameraPosition: CameraPosition(
                                target: LatLng(global_siteLat, global_siteLon),
                                zoom: 10),
                            markers: markerList.toSet()),
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
                                            zoom: 10)));
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
                              color: Color(themaColor_red),
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
                              color: Color(themaColor_red),
                              width: allPage_addBtnWidth),
                        ),

                        // 배경 색상 설정
                        backgroundColor: Color(themaColor_white),
                        // 그림자 투명도
                        elevation: 5),
                  ),

                  // /// 간격
                  // Container(
                  //   height: getFullScrennSizePercent(
                  //       context, emergencyPage_spacePerBtn),
                  // ),

                  // /// 지혈 버튼
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     Transition(
                  //     //         child: CPRPage(),
                  //     //         transitionEffect:
                  //     //             TransitionEffect.RIGHT_TO_LEFT));
                  //   },
                  //   // 내부 컴포넌트
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       // 텍스트
                  //       Text(
                  //         "Homostasis",
                  //         style: TextStyle(
                  //             color: Color(themaColor_red),
                  //             fontSize: allPage_roundBtnFontSize),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ],
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //       // 크기 설정
                  //       minimumSize: Size(
                  //           getFullScrennSizePercent(
                  //               context, allPage_roundBtnWidth),
                  //           getFullScrennSizePercent(
                  //               context, allPage_roundBtnHeight)),
                  //       maximumSize: Size(
                  //           getFullScrennSizePercent(
                  //               context, allPage_roundBtnWidth),
                  //           getFullScrennSizePercent(
                  //               context, allPage_roundBtnHeight)),
                  //       // 모양 및 테두리 설정
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius:
                  //             BorderRadius.circular(allPage_roundBtnRadius),
                  //         side: BorderSide(
                  //             color: Color(themaColor_red),
                  //             width: allPage_addBtnWidth),
                  //       ),
                  //
                  //       // 배경 색상 설정
                  //       backgroundColor: Color(themaColor_white),
                  //       // 그림자 투명도
                  //       elevation: 5),
                  // ),

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

  /// 주변 병원 api
  Future<Map> getEmergencyAPI(String addr1, String addr2) async {
    String key =
        '9cDrVY%2FAsqV%2FAF%2BOZSykqGI1IX2meqVi5E%2FQdsTirBJBqyralFvPoIl%2BIGHvVkAreT42eZgxSbXibnS2oRQvyQ%3D%3D';
    String uri =
        "http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytListInfoInqire?serviceKey=$key&Q0=$addr1&Q1=$addr2";
    late Response xmlRes;
    late Map res;
    try {
      xmlRes = await dio.get(uri);
      // json 변환
      Xml2Json xml2json = Xml2Json()..parse(xmlRes.data);
      String json = xml2json.toParker();
      // map 변환
      res = convert.json.decode(json);
    } catch (e) {}
    return res;
  }
}

/// 마커 정보
class EmergencyMarker {
  String addr;
  String name;
  String emclsName;
  String tel1;
  String tel3;
  double lat;
  double lon;

  EmergencyMarker(String addr, String name, String emclsName, String tel1,
      String tel3, double lat, double lon)
      : this.addr = addr,
        this.name = name,
        this.emclsName = emclsName,
        this.tel1 = tel1,
        this.tel3 = tel3,
        this.lat = lat,
        this.lon = lon;
}
