import 'package:cherry_app/All_EditPravacy.dart';
import 'package:cherry_app/All_signInPage.dart';
import 'package:cherry_app/Manager_EditSitePage.dart';
import 'package:cherry_app/Manager_PutSiteInfoPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transition/transition.dart';

import 'All_SiteInfoPage.dart';
import 'baseFile.dart';

/// None AppBar
class AppBarNone extends StatelessWidget implements PreferredSizeWidget {
  // 앱바에 대한 크기 정보를 줌
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(context) => AppBar(
        backgroundColor: Color(themaColor_black),
        centerTitle: true,
        title: Text("Cherry"),
      );
}

/// Emp AppBar
class AppBarAll extends StatelessWidget implements PreferredSizeWidget {
  // 앱바에 대한 크기 정보를 줌
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(context) => AppBar(
        backgroundColor: Color(themaColor_black),
        centerTitle: true,
        title: Text((global_googleUser!.email).split('@')[0]),
      );
}

/// Emp Drawer
class DrawerEmp extends StatelessWidget {
  late ImageProvider profileImg;

  DrawerEmp() {
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
              color: Color(themaColor_black),
            ),

            /// 상단 유저 정보
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: profileImg,
                backgroundColor: Color(themaColor_white),
              ),
              accountName:
                  Text(global_userRole == enum_Role.user ? "USER" : "STAFF"),
              accountEmail: Text(global_googleUser!.email),
              decoration: BoxDecoration(
                color: Color(themaColor_black),
              ),
            ),

            /// 현장 정보
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Site Information"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  Transition(
                      child: SiteInfoPageAll(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                );
              },
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
                      child: EditPrivacyPage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                );
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
                  res = await api_user_logout();
                } catch (e) {}
                if (res?.data['success']) {
                  global_googleSignIn?.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      Transition(
                          child: SignInPage(),
                          transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                      (_) => false);
                  print(">>> SuccessLogout");
                }
              },
            )
          ],
        ),
      );
}

/// Manager Drawer
class DrawerManager extends StatelessWidget {
  late ImageProvider profileImg;

  DrawerManager() {
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
              color: Color(themaColor_black),
            ),

            /// 상단 유저 정보
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: profileImg,
                backgroundColor: Color(themaColor_white),
              ),
              accountName: Text("ADMIN"),
              accountEmail: Text(global_googleUser!.email!),
              decoration: BoxDecoration(
                color: Color(themaColor_black),
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
                      child: EditPrivacyPage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                );
              },
            ),

            /// 현장 정보설정
            ListTile(
              leading: Icon(Icons.build),
              title: Text("Workspace settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  Transition(
                      child: EditSitePageManager(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT),
                );
              },
            ),

            /// 체크리스트 설정
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text("Check list settings"),
              onTap: () {},
            ),

            /// 현장 초기화
            ListTile(
              leading: Icon(
                Icons.refresh,
                color: Colors.red,
              ),
              title:
                  Text("Reset workspace", style: TextStyle(color: Colors.red)),
              onTap: () async {
                Response? res;
                try {
                  res = await api_site_deleteSite(global_siteId);
                  Navigator.pushAndRemoveUntil(
                      context,
                      Transition(
                          child: PutSiteInfoPageManager(),
                          transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                      (_) => false);
                  print(">>> site 제거 성공");
                } catch (e) {
                  print(">>> site 제거 실패");
                }
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
                  Navigator.pushAndRemoveUntil(context,
                      Transition(child: SignInPage()), (_) => false);
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
