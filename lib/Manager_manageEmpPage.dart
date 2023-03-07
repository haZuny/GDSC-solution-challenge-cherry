import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/Manager_viewWaiteInfoPage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

import 'Manager_viewEmpInfoPage.dart';

class ManageEmpPageManager extends StatefulWidget {
  @override
  State<ManageEmpPageManager> createState() => _ManageEmpPageManager();
}

class _ManageEmpPageManager extends State<ManageEmpPageManager> {
  /// 현재 페이지
  int currentPage = 0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarEmp(),
          drawer: DrawerEmp(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 0
                  ? Icon(
                      Icons.radio_button_checked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor)),
              currentPage == 1
                  ? Icon(
                      Icons.radio_button_checked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor),
                    )
                  : Icon(Icons.radio_button_unchecked,
                      size: getFullScrennSizePercent(
                          context, manageEmpPage_pageIndicatorIconSize),
                      color: Color(allPage_btnFontColor)),
            ],
          ),
          body: PageView(
            /// 현재 페이지 설정
            onPageChanged: (val) {
              setState(() {
                currentPage = val;
              });
            },
            children: [
              /// 첫번째 화면
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 타이틀
                      Text(
                        "Checked",
                        style: TextStyle(fontSize: allPage_titleFontSize),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerTitle),
                      ),

                      /// Checked 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page1_checkedFoemHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView(
                            children: [
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                            ],
                          )),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerBigBox),
                      ),

                      /// 타이틀
                      Text(
                        "Unchecked",
                        style: TextStyle(
                          fontSize: allPage_titleFontSize,
                        ),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page1_spacePerTitle),
                      ),

                      /// Unchecked 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page1_uncheckedFoemHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                                  BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView(
                            children: [
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                              EmpListTile("Hajun Kwon / 24 / Employee"),
                            ],
                          )),
                    ],
                  ),
                ),
              ),

              /// 2번째 화면
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// 타이틀
                      Text(
                        "Checked",
                        style: TextStyle(fontSize: allPage_titleFontSize),
                      ),

                      /// 간격
                      Container(
                        height: getFullScrennSizePercent(
                            context, manageEmpPage_page2_spacePerTitle),
                      ),

                      /// Checked 영역
                      Container(
                          width: getFullScrennSizePercent(
                              context, allPage_mainComponentsWidth),
                          height: getFullScrennSizePercent(
                              context, manageEmpPage_page2_waiteListHeight),
                          decoration: BoxDecoration(
                              color: Color(themaColor_white),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: allPage_shadowBlurRadius,
                                    offset: Offset(allPage_shadowOffSet,
                                        allPage_shadowOffSet),
                                    color: Color(themaColor_whiteBlack))
                              ],
                              borderRadius:
                              BorderRadius.circular(allPage_bigBoxRadious)),
                          child: ListView(
                            children: [
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                              WaiteListTile("Hajun Kwon / 24 / Employee"),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

/// 리스트 타일 요소(첫번째 화면)
class EmpListTile extends StatelessWidget {
  late String msg;

  EmpListTile(String msg) : this.msg = msg;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(manageEmpPage_listTilePadding),
              child: Text(
                this.msg,
                style: TextStyle(fontSize: manageEmpPage_listTextFontSize),
              ),
            ),
            Divider(
              color: Color(themaColor_whiteBlack),
              height: 0,
            ),
            // 간격
            Container(
              height: manageEmpPage_listTilePaddingTopBottom,
            )
          ],
        ),
    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewEmpInfoPage()));
    },
      );
}

/// 리스트 타일 요소(두번째 화면)
class WaiteListTile extends StatelessWidget {
  late String msg;

  WaiteListTile(String msg) : this.msg = msg;

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(manageEmpPage_listTilePadding),
          child: Text(
            "Hajun Kwon / 24 / Employee",
            style: TextStyle(fontSize: manageEmpPage_listTextFontSize),
          ),
        ),
        Divider(
          color: Color(themaColor_whiteBlack),
          height: 0,
        ),
        // 간격
        Container(
          height: manageEmpPage_listTilePaddingTopBottom,
        )
      ],
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewWaiteInfoPage()));
    },
  );
}