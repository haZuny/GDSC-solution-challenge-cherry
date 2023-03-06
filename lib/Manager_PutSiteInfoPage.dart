import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/Manager_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

import 'AppBar_Drawer.dart';

class PutSiteInfoPageManager extends StatefulWidget {
  @override
  State<PutSiteInfoPageManager> createState() => _PutSiteInfoPageManager();
}

class _PutSiteInfoPageManager extends State<PutSiteInfoPageManager> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarNone(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  Text(
                    "Put workspace's info",
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
                        context, allPage_signUpTFWidth),
                    child: TextField(
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
                          offset: Offset(allPage_shadowOffSet,
                              allPage_shadowOffSet),
                          color: Color(themaColor_whiteBlack))
                    ]),
                  ),

                  // 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, putSiteInfoPage_spacePerTFs),
                  ),

                  /// 주소 TF
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_signUpTFWidth),
                    child: TextField(
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
                        context, putSiteInfoPage_spacePerTFs),
                  ),

                  /// 상세주소
                  Container(
                    width: getFullScrennSizePercent(
                        context, allPage_signUpTFWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        // 힌트
                        hintText: "Address detail",
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
                        context, putSiteInfoPage_spacePerNextBtn),
                  ),

                  // next 버튼
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageManager()));
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
        ),
      );
}

/// 바텀 시트
class SiteInfoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
    },
    child: Container(
          padding: EdgeInsets.all(getFullScrennSizePercent(
              context, putSiteInfoPage_containerPadding)),
          // 크기 설정
          height: MediaQuery.of(context).size.height *
              putSiteInfoPage_bottomsheetHeight,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Address',
                          hintStyle:
                              TextStyle(color: Color(themaColor_whiteBlack))),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: putCheckCodePage_checkBtnFontSize,
                            color: Color(allPage_btnFontColor)),
                      )),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: putSiteInfoPage_siteListTileFontPadding,
                            bottom: putSiteInfoPage_siteListTileFontPadding),
                        child: Text(
                          "충남 아산시 순천향로 23",
                          style: TextStyle(
                              fontSize: putSiteInfoPage_siteListTileFontSize),
                        ),
                      ),
                      onTap: (){
                        print("asdf");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
  );
}
