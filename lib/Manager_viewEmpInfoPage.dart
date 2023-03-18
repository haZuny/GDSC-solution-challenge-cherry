import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewEmpInfoPage extends StatefulWidget {
  late int userId;

  ViewEmpInfoPage(int userId) : this.userId = userId;

  @override
  State<ViewEmpInfoPage> createState() => _ViewEmpInfoPage(userId);
}

class _ViewEmpInfoPage extends State<ViewEmpInfoPage> {
  late int userId;
  String userName = "";
  String userRole = "";
  int userAge = -1;
  String userEmail = "";
  String userPhone = "";

  int _dropdownVal = 0;

  _ViewEmpInfoPage(int userId) : this.userId = userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUserInfo(userId);
  }

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerEmp(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// 이름, 등급
                  Text(
                    userName == "" ? "" : "$userName / $userRole",
                    style: TextStyle(
                        fontSize: viewPeopleInfoPage_fontSize,
                        fontWeight: FontWeight.bold),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerText),
                  ),

                  /// 나이
                  Text(
                    userAge < 0 ? "" : "$userAge years old",
                    style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerText),
                  ),

                  /// 이메일
                  Text(
                    "$userEmail",
                    style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerText),
                  ),

                  /// 전화번호
                  Text(
                    "$userPhone",
                    style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerText),
                  ),

                  /// 등급 변경
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Role: ",
                        style: TextStyle(fontSize: viewPeopleInfoPage_fontSize),
                      ),
                      Container(
                        width: getFullScrennSizePercent(
                            context, manageEmpPage_spacePerRole),
                      ),
                      DropdownButton(
                          alignment: AlignmentDirectional.center,
                          value: _dropdownVal,
                          items: [
                            DropdownMenuItem(
                                value: 0,
                                child: Text("USER",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  "STAFF",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                          onChanged: (e) async {
                            // user
                            if (e == 0) {
                              late Response res;
                              try {
                                res = await api_admin_changeUserRole(
                                    this.userId, "USER");
                                setState(() {
                                  this.userRole = "USER";
                                  this._dropdownVal = 0;
                                });
                              } catch (e) {}
                            }
                            // staff
                            else if (e == 1) {
                              late Response res;
                              try {
                                res = await api_admin_changeUserRole(
                                    this.userId, "STAFF");
                                setState(() {
                                  this.userRole = "STAFF";
                                  this._dropdownVal = 1;
                                });
                              } catch (e) {}
                            }
                            _dropdownVal = e!;
                          }),
                    ],
                  ),

                  /// 간격
                  Container(
                    height: getFullScrennSizePercent(
                        context, viewPeopleInfoPage_spacePerBottomBtn),
                  ),

                  /// 쫒아내기
                  TextButton(
                      onPressed: () async {
                        late Response res;
                        try {
                          res = await api_admin_deleteEmp(this.userId);
                          Navigator.pop(context);
                        } catch (e) {}
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Color(allPage_btnSubFontColor),
                            fontSize: allPage_btnFontSize),
                      ))
                ],
              ),
            ),
          ),
        ),
      );

  /// 정보 초기화
  Future<void> updateUserInfo(int userId) async {
    late Response res;
    try {
      res = await api_admin_getUserInfo(userId);
      setState(() {
        this.userName = res.data['data']['userName'];
        this.userRole = res.data['data']['role'];
        this.userAge = res.data['data']['userAge'];
        this.userEmail = res.data['data']['userEmail'];
        // this.userPhone = res.data['data']['userPhone'];

        if (this.userRole == 'USER')
          this._dropdownVal = 0;
        else if (this.userRole == "STAFF") this._dropdownVal = 1;
      });
    } catch (e) {}
  }
}
