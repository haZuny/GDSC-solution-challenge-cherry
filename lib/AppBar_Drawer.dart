import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
class AppBarEmp extends StatelessWidget implements PreferredSizeWidget {
  // 앱바에 대한 크기 정보를 줌
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(context) => AppBar(
        backgroundColor: Color(themaColor_black),
        centerTitle: true,
        title: Text("hj3175791"),
      );
}

/// Emp Drawer
class DrawerEmp extends StatelessWidget {
  @override
  Widget build(context) => Drawer(
        child: ListView(
          children: [
            /// 여백
            Container(
              height: getFullScrennSizePercent(context, drawer_spaceTop, false),
              color: Color(themaColor_black),
            ),
            /// 상단 유저 정보
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/img/logo.png'),
                backgroundColor: Color(themaColor_white),
              ),
              accountName: Text("Employee"),
              accountEmail: Text("hj3175791@gmail.com"),
              decoration: BoxDecoration(
                color: Color(themaColor_black),
              ),
            ),

            /// 현장 정보
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Site Information"),
              onTap: () {},
            ),

            /// 설정
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Privacy settings"),
              onTap: () {},
            ),
            Divider(
                color: Color(themaColor_whiteBlack),
                height: drawer_dividerHeight,
                thickness: drawer_dividerWidth),

            /// 로그아웃
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign out"),
              onTap: () {},
            )
          ],
        ),
      );
}
