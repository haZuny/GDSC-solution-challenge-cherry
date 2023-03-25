import 'package:cherry_app/All_PutPrivacyPage.dart';
import 'package:cherry_app/All_signInPage.dart';
import 'package:cherry_app/Emp_PutCheckCodePage.dart';
import 'package:cherry_app/All_PutSiteInfoPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transition/transition.dart';
import 'Dialog.dart';
import 'baseFile.dart';

/// AppBar
class AppBarAll extends StatelessWidget implements PreferredSizeWidget {
  // 앱바에 대한 크기 정보를 줌
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(context) => AppBar(
        backgroundColor: Color(themaColor_white),
        centerTitle: true,
        title: Text(
          "C H E R R Y",
          style: TextStyle(color: Color(themaColor_black)),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(themaColor_black)),
      );
}

/// Drawer
class DrawerAll extends StatelessWidget {
  late ImageProvider profileImg;

  DrawerAll() {
    if (global_googleUser?.photoUrl == null) {
      profileImg = AssetImage('assets/img/defaultUserImg.png');
    } else {
      profileImg = NetworkImage(global_googleUser!.photoUrl!);
    }
  }

  @override
  Widget build(context) => Drawer(
        child: ListView(
          children: [
            /// 여백
            Container(
              height: getFullScrennSizePercent(context, drawer_spaceTop),
              color: Color(themaColor_whiteYellow),
            ),

            /// 상단 유저 정보
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: profileImg,
                backgroundColor: Color(themaColor_white),
              ),
              accountName: Text(
                global_userRole == enum_Role.user
                    ? "USER"
                    : global_userRole == enum_Role.manager
                        ? "ADMIN"
                        : "STAFF",
                style: TextStyle(color: Color(themaColor_black)),
              ),
              accountEmail: Text(
                global_googleUser!.email!,
                style: TextStyle(color: Color(themaColor_black)),
              ),
              decoration: BoxDecoration(
                color: Color(themaColor_whiteYellow),
              ),
            ),

            /// 설정
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Privacy settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  Transition(
                      child: PutPrivacyPage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                );
              },
            ),

            /// 현장 정보설정
            if (global_userRole == enum_Role.manager)
              ListTile(
                leading: Icon(Icons.build),
                title: Text("Workspace settings"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    Transition(
                        child: PutSiteInfoPageAll(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                  );
                },
              ),

            /// 현장 초기화
            if (global_userRole == enum_Role.manager)
              ListTile(
                leading: Icon(
                  Icons.refresh,
                  color: Colors.red,
                ),
                title: Text("Reset workspace",
                    style: TextStyle(color: Colors.red)),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CheckAlertDialog(
                          "Are you really removing the scene?",
                          "Back",
                          "Remove")).then((value) async {
                    if (value) {
                      Response? res;
                      try {
                        res = await api_site_deleteSite(global_siteId);
                        clearSiteGlobalVar();
                        Navigator.pushAndRemoveUntil(
                            context,
                            Transition(child: PutSiteInfoPageAll()),
                            (_) => false);
                      } catch (e) {}
                    }
                  });
                },
              ),

            /// 현장 탈퇴
            if (global_userRole != enum_Role.manager)
              ListTile(
                leading: Icon(
                  Icons.refresh,
                  color: Colors.red,
                ),
                title: Text("Leave workspace",
                    style: TextStyle(color: Colors.red)),
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => CheckAlertDialog(
                          "Are you sure you want to leave the field?",
                          "Back",
                          "Leave")).then((value) async {
                    if (value) {
                      Response? res;
                      try {
                        res = await api_admin_deleteEmp(global_userId);
                        Navigator.pushAndRemoveUntil(
                            context,
                            Transition(child: PutCheckCodePageEmp()),
                            (_) => false);
                      } catch (e) {}
                    }
                  });
                },
              ),
            Divider(
                color: Color(themaColor_whiteBlack),
                height: drawer_dividerHeight,
                thickness: drawer_dividerWidth),

            /// 로그아웃
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign out"),
              onTap: () async {
                Response? res;
                try {
                  res = await api_admin_logout();
                } catch (e) {}
                if (res?.data['success']) {
                  await global_googleSignIn?.signOut();
                  print(">>> 구글 로그아웃");
                  Navigator.pushAndRemoveUntil(
                      context, Transition(child: SignInPage()), (_) => false);
                }
              },
            )
          ],
        ),
      );

  /// API
  // logout
  Future<Response> api_admin_logout() async {
    String uri = api_hostURI + "admin/logout";
    dio.options.headers = {
      'Authorization': "bearer " + authorization,
      'RefreshToken': refreshToken
    };
    Response res = await dio.post(uri);
    return res;
  }
}

/// SnackBar
SnackBar getSnackBar(String msg) {
  return SnackBar(
    content: Container(
      child: Text(msg),
      padding: EdgeInsets.all(snackBar_padding),
      margin: EdgeInsets.all(snackBar_margin),
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(snackBar_radius)),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    padding: EdgeInsets.zero,
    duration: Duration(seconds: snackBar_duration),
  );
}
