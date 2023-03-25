import 'package:cherry_app/All_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'All_signInPage.dart';
import 'AppBar_Drawer.dart';
import 'package:dio/dio.dart';

class PutSiteInfoPageAll extends StatefulWidget {
  @override
  State<PutSiteInfoPageAll> createState() => _PutSiteInfoPageAll();
}

/// TF 컨트롤러
TextEditingController _siteNameController = TextEditingController();
TextEditingController _addrController = TextEditingController();
TextEditingController _bottomSheetAddrController = TextEditingController();

/// 주소 검색 관련 변수
int _selectedAddrIdx = -1;
List<Addr> _addrList = [];

class _PutSiteInfoPageAll extends State<PutSiteInfoPageAll> {
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
          drawer: global_haveSite ? DrawerAll() : null,

          /// bottom bar
          bottomNavigationBar: global_haveSite
              ? BottomAppBar(
                  child: Container(
                    height: getFullScrennSizePercent(
                        context, bottomBar_bottomBarHeight),
                  ),
                  shape: CircularNotchedRectangle(),
                  color: Color(themaColor_white),
                  notchMargin: getFullScrennSizePercent(
                      context, bottomBar_bottomBarNorch),
                )
              : null,

          /// floating btn
          floatingActionButton: global_haveSite
              ? Padding(
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
                      Navigator.pushAndRemoveUntil(context,
                          Transition(child: HomePageAll()), (_) => false);
                    },
                  ),
                )
              : null,

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
                    global_haveSite
                        ? "Edit site's Information"
                        : "Put site's Information",
                    style: TextStyle(
                      fontSize: allPage_titleFontSize,
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
                          builder: (context) => SiteInfoBottomSheet(),
                        );
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

                  /// 뒤로가기 버튼
                  if (!global_haveSite)
                    ElevatedButton(
                      onPressed: () async {
                        late Response res;
                        try {
                          res = await api_admin_logout();
                        } catch (e) {}
                        await global_googleSignIn?.signOut();
                        print(">>> 구글 로그아웃");
                        Navigator.pushAndRemoveUntil(context,
                            Transition(child: SignInPage()), (_) => false);
                      },
                      // 내부 컴포넌트
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 텍스트
                          Text(
                            "Back",
                            style: TextStyle(
                                color: Color(themaColor_yellow),
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
                                color: Color(themaColor_yellow),
                                width: allPage_addBtnWidth),
                          ),

                          // 배경 색상 설정
                          backgroundColor: Color(themaColor_white),
                          // 그림자 투명도
                          elevation: 10),
                    ),

                  /// 간격
                  if (!global_haveSite)
                    Container(
                      height: getFullScrennSizePercent(
                          context, editSiteInfoPage_spacePerBtns),
                    ),

                  /// 완료 버튼
                  ElevatedButton(
                    onPressed: () async {
                      String siteName = _siteNameController.text;

                      /// 널처리
                      if (siteName == "") {
                        print(">>> null WorkspaceName TextField");
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar("Please enter the site name."));
                        return;
                      }
                      if (_selectedAddrIdx < 0) {
                        print(">>> null Address");
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar("Please enter the site address."));
                        return;
                      }

                      Response? res;

                      /// 수정
                      if (global_haveSite) {
                        try {
                          res = await api_site_editSite(
                              global_siteId,
                              _siteNameController.text,
                              _addrList[_selectedAddrIdx].lat!,
                              _addrList[_selectedAddrIdx].lon!,
                              _addrList[_selectedAddrIdx].addr1!,
                              _addrList[_selectedAddrIdx].addr2!);
                          Navigator.pushAndRemoveUntil(context,
                              Transition(child: HomePageAll()), (_) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              getSnackBar("Changes have been applied."));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("Change failed."));
                        }
                      }

                      /// 생성
                      else {
                        try {
                          res = await api_site_createSite(
                              _siteNameController.text,
                              _addrList[_selectedAddrIdx].lat!,
                              _addrList[_selectedAddrIdx].lon!,
                              _addrList[_selectedAddrIdx].addr1!,
                              _addrList[_selectedAddrIdx].addr2!);
                          Navigator.pushAndRemoveUntil(context,
                              Transition(child: HomePageAll()), (_) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              getSnackBar(
                                  "You have successfully created a site."));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar("Creation failed."));
                        }
                      }
                    },
                    // 내부 컴포넌트
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트
                        Text(
                          "Done",
                          style: TextStyle(
                              color: Color(themaColor_yellow),
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
                              color: Color(themaColor_yellow),
                              width: allPage_addBtnWidth),
                        ),

                        // 배경 색상 설정
                        backgroundColor: Color(themaColor_white),
                        // 그림자 투명도
                        elevation: 10),
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
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
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
                        onChanged: (val) {
                          searchAddr(val);
                        },
                      ),
                    ),
                    // Search 버튼
                    TextButton(

                        /// 카카오 주소검색 api
                        onPressed: () async {
                          /// 카카오 주소검색 api
                          searchAddr(_bottomSheetAddrController.text);
                        },
                        child: Text(
                          "Search",
                          style: TextStyle(
                              fontSize: editSiteInfoPage_checkBtnFontSize,
                              color: Color(themaColor_blue)),
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
        ),
      );

  searchAddr(String addr) async {
    String _AddrSearchURL =
        "http://dapi.kakao.com/v2/local/search/address.json?query=";
    String _AddrSearchKey = "93349143720fbaa860b00f8191e7f2de";

    Dio dio = Dio();
    dio.options.headers = {'Authorization': 'KakaoAK ' + _AddrSearchKey};

    late Response res;
    try {
      res = await dio.get(_AddrSearchURL + addr);

      // 리스트 갱신
      setState(() {
        _addrList.clear();
        for (int i = 0; i < res.data['meta']['total_count']; i++) {
          Map data = res.data['documents'][i]['road_address'];
          _addrList.add(Addr(
              data['address_name'],
              double.parse(data['x']),
              double.parse(data['y']),
              data['region_1depth_name'],
              data['region_2depth_name']));
        }
      });
      print(">>> 카카오 로컬 api 호출 받아옴");
    } catch (e) {}
  }
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
            child: Container(
              width: double.infinity,
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
