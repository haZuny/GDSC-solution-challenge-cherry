import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';

class CheckListPageEmp extends StatefulWidget {
  @override
  State<CheckListPageEmp> createState() => _CheckListPageEmp();
}

class _CheckListPageEmp extends State<CheckListPageEmp> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarEmp(),
          drawer: DrawerEmp(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 타이틀
                  Text(
                    "Check today's safety",
                    style: TextStyle(fontSize: allPage_titleFontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, allPage_spacePerTitleAndComponents),
                  ),

                  /// 체크 영역
                  Container(
                      width: getFullScrennSizePercent(
                          context, checkListPage_checkFormWidth),
                      height: getFullScrennSizePercent(
                          context, checkListPage_checkFormHeight),
                      decoration: BoxDecoration(
                          color: Color(themaColor_white),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: allPage_shadowBlurRadius,
                                offset: Offset(
                                    allPage_shadowOffSet, allPage_shadowOffSet),
                                color: Color(themaColor_whiteBlack))
                          ],
                          borderRadius: BorderRadius.circular(
                              checkListPage_checkFormRadious)),
                      child: ListView(
                        children: [
                          /// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(checkListPage_dialogTextPadding),
                                      child: Text(
                                        "작업에 적합한 보호구 지급 지급 지급 지급",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: checkListPage_listTextFontSize),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),/// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(checkListPage_dialogTextPadding),
                                      child: Text(
                                        "작업에 적합한 보호구 지급 지급 지급 지급",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: checkListPage_listTextFontSize),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),

                          /// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              checkListPage_dialogTextPadding),
                                          child: Text(
                                            "작업에 적합한 보호구 지급 지급 지급 지급",
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    checkListPage_listTextFontSize),
                                          ),
                                        ),
                                      ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),

                          /// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              checkListPage_dialogTextPadding),
                                          child: Text(
                                            "작업에 적합한 보호구 지급 지급 지급 지급",
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    checkListPage_listTextFontSize),
                                          ),
                                        ),
                                      ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),

                          /// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              checkListPage_dialogTextPadding),
                                          child: Text(
                                            "작업에 적합한 보호구 지급 지급 지급 지급",
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    checkListPage_listTextFontSize),
                                          ),
                                        ),
                                      ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),

                          /// 요소 1
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: checkListPage_listTilePaddingLeft,
                                  top: checkListPage_listTilePaddingTopBottom,
                                  bottom: checkListPage_listTilePaddingTopBottom),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "작업에 적합한 보호구 지급 지급 지급 지급",
                                      style: TextStyle(
                                          fontSize:
                                              checkListPage_listTextFontSize),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(value: false, onChanged: (val) {})
                                ],
                              ),
                            ),
                            // 다이얼로그
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              checkListPage_dialogTextPadding),
                                          child: Text(
                                            "작업에 적합한 보호구 지급 지급 지급 지급",
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    checkListPage_listTextFontSize),
                                          ),
                                        ),
                                      ));
                            },
                          ),
                          Divider(
                            color: Color(themaColor_whiteBlack),
                          ),
                        ],
                      )),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, checkListPage_spacePerBackBtn),
                  ),

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
                      ))
                ],
              ),
            ),
          ),
        ),
      );
}
