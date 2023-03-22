import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/Manager_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';
import 'package:dio/dio.dart';

import 'Emp_HomePage.dart';

class EditSitePageManager extends StatefulWidget {
  @override
  State<EditSitePageManager> createState() => _EditSitePageManager();
}

/// TF 컨트롤러
TextEditingController _siteNameController = TextEditingController();
TextEditingController _addrController = TextEditingController();
TextEditingController _bottomSheetAddrController = TextEditingController();

/// 주소 검색 관련 변수
int _selectedAddrIdx = -1;
List<Addr> _addrList = [];

class _EditSitePageManager extends State<EditSitePageManager> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 변수 초기화
    _siteNameController.text = global_siteName;
    _addrController.text = "";
    _bottomSheetAddrController.text = "";
    _selectedAddrIdx = -1;
    _addrList.clear();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),

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
                  Navigator.pushAndRemoveUntil(context,
                      Transition(child: HomePageEmp()), (_) => false);
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

                  Text(
                    "Edit workspace's info",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  /// 작업 현장 이름 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      controller: _siteNameController,
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Workspace name",
                        hintStyle:
                            TextStyle(color: Color(themaColor_whiteBlack)),
                        // 색상(설정 안하면 그림자에 먹힘)
                        filled: true,
                        fillColor: Colors.white,
                        // 선택 안됐을때 테두리
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                        // 선택 됐을때 테두리
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                      ),
                    ),
                    // 그림자
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: allPage_shadowBlurRadius,
                          offset: Offset(
                              allPage_shadowOffSet, allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                  ),

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, editSiteInfoPage_spacePerTFs),
                  ),

                  /// 주소 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_mainComponentsWidth),
                    child: TextField(
                      controller: _addrController,
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Address",
                        hintStyle:
                            TextStyle(color: Color(themaColor_whiteBlack)),
                        // 색상(설정 안하면 그림자에 먹힘)
                        filled: true,
                        fillColor: Colors.white,
                        // 선택 안됐을때 테두리
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                        // 선택 됐을때 테두리
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(themaColor_whiteBlack),
                                width: allPage_btnBorderWidth),
                            borderRadius:
                                BorderRadius.circular(allPage_TFRadius)),
                      ),
                      // 수정 불가 설정
                      readOnly: true,
                      // 터치 메소드
                      onTap: () {
                        // 텍스트 필드 초기화
                        _bottomSheetAddrController.text = "";

                        /// 바텀 쉬트
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious),
                            ),
                            context: context,
                            builder: (context) => SiteInfoBottomSheet());
                      },
                    ),
                    // 그림자
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: allPage_shadowBlurRadius,
                          offset: Offset(
                              allPage_shadowOffSet, allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                  ),

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, editSiteInfoPage_spacePerBottomBtn),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Back 버튼
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: allPage_btnFontSize,
                                color: Color(allPage_btnFontColor)),
                          )),

                      /// 간격
                      Container(
                        width: getFullScrennSizePercent(
                            context, editSiteInfoPage_spaceBottomBtn),
                      ),

                      // 완료 버튼
                      TextButton(
                          onPressed: () async {
                            String siteName = _siteNameController.text;

                            /// 널처리
                            if (siteName == "") {
                              print(">>> null WorkspaceName TextField");
                              return;
                            }
                            if (_selectedAddrIdx < 0) {
                              print(">>> null Address");
                              return;
                            }

                            Response? res;
                            try {
                              res = await api_site_editSite(
                                  global_siteId,
                                  _siteNameController.text,
                                  _addrList[_selectedAddrIdx].lat!,
                                  _addrList[_selectedAddrIdx].lon!,
                                  _addrList[_selectedAddrIdx].addr1!,
                                  _addrList[_selectedAddrIdx].addr2!);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  Transition(
                                      child: HomePageManager(),
                                      transitionEffect:
                                          TransitionEffect.LEFT_TO_RIGHT),
                                  (_) => false);
                            } catch (e) {}
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontSize: allPage_btnFontSize,
                                color: Color(allPage_btnFontColor)),
                          )),
                    ],
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

/// 바텀 시트
class SiteInfoBottomSheet extends StatefulWidget {
  @override
  State<SiteInfoBottomSheet> createState() => _SiteInfoBottomSheet();
}

class _SiteInfoBottomSheet extends State<SiteInfoBottomSheet> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Container(
          padding: EdgeInsets.all(getFullScrennSizePercent(
              context, editSiteInfoPage_containerPadding)),
          // 크기 설정
          height: MediaQuery.of(context).size.height *
              editSiteInfoPage_bottomsheetHeight,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _bottomSheetAddrController,
                      decoration: InputDecoration(
                          hintText: 'Address',
                          hintStyle:
                              TextStyle(color: Color(themaColor_whiteBlack))),
                    ),
                  ),
                  // Search 버튼
                  TextButton(

                      /// 카카오 주소검색 api
                      onPressed: () async {
                        FocusManager.instance.primaryFocus
                            ?.unfocus(); // 키보드 닫기 이벤트

                        String _AddrSearchURL =
                            "http://dapi.kakao.com/v2/local/search/address.json?query=";
                        String _AddrSearchKey =
                            "93349143720fbaa860b00f8191e7f2de";

                        Dio dio = Dio();
                        dio.options.headers = {
                          'Authorization': 'KakaoAK ' + _AddrSearchKey
                        };

                        var res = await dio.get(
                            _AddrSearchURL + _bottomSheetAddrController.text);

                        setState(() {
                          _addrList.clear();
                          for (int i = 0;
                              i < res.data['meta']['total_count'];
                              i++) {
                            Map data = res.data['documents'][i]['road_address'];
                            _addrList.add(Addr(
                                data['address_name'],
                                double.parse(data['x']),
                                double.parse(data['y']),
                                data['region_1depth_name'],
                                data['region_2depth_name']));
                          }
                        });
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: editSiteInfoPage_checkBtnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      AddrSearchListTile(_addrList[index].addrName, index),
                  itemCount: _addrList.length,
                ),
              )
            ],
          ),
        ),
      );
}

/// 주소 클래스
class Addr {
  String addrName;
  double? lat;
  double? lon;
  String? addr1;
  String? addr2;

  Addr(String addressName, double x, double y, String address1, String address2)
      : addrName = addressName,
        lon = x,
        lat = y,
        addr1 = address1,
        addr2 = address2;
}

/// 주소 검색 리스트 타일
class AddrSearchListTile extends StatelessWidget {
  String addr = '';
  int idx = -1;

  AddrSearchListTile(String addr, int i)
      : this.addr = addr,
        idx = i;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                  top: editSiteInfoPage_siteListTileFontPadding,
                  bottom: editSiteInfoPage_siteListTileFontPadding),
              child: Text(
                this.addr,
                style:
                    TextStyle(fontSize: editSiteInfoPage_siteListTileFontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              _addrController.text = this.addr;
              _selectedAddrIdx = this.idx;
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 0,
          )
        ],
      );
}
