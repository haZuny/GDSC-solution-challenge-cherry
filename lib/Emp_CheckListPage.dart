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
                          context, allPage_mainComponentsWidth),
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
                          borderRadius:
                              BorderRadius.circular(allPage_bigBoxRadious)),
                      child: ListView(
                        children: [
                          CheckListTileEmp("적합한 안전 도구 제공 제공 제공"),
                          CheckListTileEmp("적합한 안전 도구 제공 제공 제공"),
                          CheckListTileEmp("적합한 안전 도구 제공 제공 제공"),
                          CheckListTileEmp("적합한 안전 도구 제공 제공 제공"),
                          CheckListTileEmp("적합한 안전 도구 제공 제공 제공"),
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

/// 리스트 타일 요소
class CheckListTileEmp extends StatelessWidget{
  late String msg;

  CheckListTileEmp(String msg) : this.msg = msg;

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            // 간격
            Container(
              width: checkListPage_listTilePaddingLeft,
            ),
            Expanded(
              child: Text(
                msg,
                style: TextStyle(
                    fontSize:
                    checkListPage_listTextFontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Checkbox(value: false, onChanged: (val) {})
          ],
        ),
        Divider(
          color: Color(themaColor_whiteBlack),
          height: 0,
        ),
        // 간격
        Container(
          height:
          checkListPage_listTilePaddingTopBottom,
        )
      ],
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
                msg,
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize:
                    checkListPage_listTextFontSize),
              ),
            ),
          ));
    },
  );

}