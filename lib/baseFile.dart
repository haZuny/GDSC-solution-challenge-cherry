import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// var
// SignIn
GoogleSignIn? global_googleSignIn;
GoogleSignInAccount? global_googleUser; // 구글 로그인

// SignUp logic, 회원가입시 어느 페이지 선택했는지 결정
enum enum_Role { manager, user, staff }

enum_Role? global_userRole;
// site
int global_siteId = -1;
String global_siteCode = "";
String global_siteName = "";
double global_siteLat = 0;
double global_siteLon = 0;
String global_siteAdd1 = "";
String global_siteAdd2 = "";
// privacy
int global_userId = -1;
String global_userName = "";
String global_userPhoneNum = "";
int global_userAge = 0;
bool global_haveSite = false;

/// 공통
// Color
int themaColor_white = 0xFFFFFFFF; // 하얀색
int themaColor_black = 0xFF000000; // 검정색
int themaColor_yellow = 0xffebba09; // 노랑색
int themaColor_whiteBlack = 0xff909090; // 연한 검정
int themaColor_whiteYellow = 0xFFFFF2C1; // 연한 노랑
int themaColor_blue = 0xff2378b7; // 텍스트버튼 컬러
int themaColor_red = 0xffbb2f2f; // 텍스트버튼 서브 컬러
// Size(Percent)
int allPage_spaceTopDown = 10; // 위아래 공간
int allPage_spacePerTitleAndComponents = 15; // 타이틀과 컴포넌트 사이의 간격
int allPage_mainComponentsWidth = 80; // 컴포넌트 너비
int allPage_spacePerTitleAndSubTitme = 3; // 타이틀과 서브타이틀 간격
int allPage_roundBtnWidth = 60; // 둥근 버튼 가로
int allPage_roundBtnHeight = 15; // 둥근 버튼 세로
// Radius
double allPage_subTitleLineRadius = 20; // 서브타이틀 배경 둥글기
double allPage_btnRadius = 10; // 버튼 둥글기
double allPage_TFRadius = 10; // 텍스트필드 둥글기
double allPage_bigBoxRadious = 20; // 큰 박스 둥글기
double allPage_roundBtnRadius = 30; // 둥근 버튼 둥글기
// Width(두께)
double allPage_btnBorderWidth = 0.1; // 버튼 테두리
double allPage_addBtnWidth = 2; // 버튼 테두리 두께
double allPage_BigSpaceWidth = 1; // 큰 영역 테두리 두께
// FontSize
double allPage_titleFontSize = 25; // 타이틀 폰트 크기
double allPage_subTitleFontSize = 17; // 서브 타이틀 폰트 크기
double allPage_btnFontSize = 18; // 텍스트 버튼 폰트 크기
double allPage_roundBtnFontSize = 20; // 둥근 버튼 폰트 크기
// Shadow
double allPage_shadowBlurRadius = 10;
double allPage_shadowOffSet = 5;

/// AppBar, Drawer, bottomAppBar, dialog
// drawer
int drawer_spaceTop = 2;
double drawer_dividerWidth = 0.2;
double drawer_dividerHeight = 0;
// bottomBar
int bottomBar_bottomBarHeight = 10; // 바텀 네비게이션 높이
int bottomBar_bottomBarNorch = 2; // 바텀 네비게이션 파인부분
int bottomBar_floatingBtnMargin = 5; // 바텀 플로팅버튼 하단 마진
int bottomBar_floatingBtnSize = 10; // 바텀 플로팅버튼 크기
// Dialog
int dialog_spacePerText = 2; // 텍스트간 간격
int dialog_spacePerBottomBtn = 30; // 아래 버튼과의 간격
int dalog_spacePerBtns = 10; // 버튼끼리 간격
double dialog_fontSize = 20; // 폰트 크기
double dialog_subFontSize = 16; // 작은 폰트 크기
double dialog_dialogRound = 20; // 둥글기
// Snack Bar
double snackBar_padding = 10; // 스낵바 패딩
double snackBar_margin = 10; // 스낵바 마진
double snackBar_radius = 10; // 스낵바 둥글기
int snackBar_duration = 1; // 스낵바 시간

/// SignInPage
// Size(Percent)
int signInPage_logoWidth = 70; // 로고 가로 크기
int signInPage_spacePerLogo = 15; // 로고와의 간격
int signInPage_loginBtnHeight = 15; // 로그인 버튼 세로
int siginInPage_googleLogoSize_width = 8; // 구글 로그 사이즈
int siginInPage_googleLogoFontColor = 0xffb4b4b4; // 구글 로그 사이즈
// Width(두께)
double signInPage_loginBtnBorderWidth = 0.1;

/// EditPrivacyPage
// Size
int EditPrivacyPage_spacePerTFs = 5; // 텍스트 필드 사이의 간격
int EditPrivacyPage_spacePerNextBtn = 15; // 넥스트 버튼 사이의 간격
int EditPrivacyPage_spacePerBtn = 5; // 버튼 사이의 간격

/// PutCheckCodePage
// Size
int putCheckCodePage_spaceTitle = 15; // 타이틀과의 간격
int putCheckCodePage_spaceBottomBtn = 10; // 하단 버튼 끼리의 간격(세로)
int putCheckCodePage_spacePerBtns = 5; // 버튼 사이 간격
double putCheckCodePage_checkBtnFontSize = 14; // 체크 버튼 폰트 크기

/// EditSiteInfoPage
// Size
int editSiteInfoPage_spacePerTFs = 5; // 텍스트 필드 사이의 간격
int editSiteInfoPage_spacePerBottomBtn = 20; // 하단 버튼과의 간격(세로)
int editSiteInfoPage_spaceBottomBtn = 10; // 하단 버튼끼리의 간격(가로)
int editSiteInfoPage_containerPadding = 10; // 바텀시트 패딩
int editSiteInfoPage_spacePerBtns = 5; // 버튼 사이 간격
double editSiteInfoPage_bottomsheetHeight = 0.6; // 바텀 시트 크기(세로)
double editSiteInfoPage_checkBtnFontSize = 14; // 서치 버튼 폰트 크기
// Font
double editSiteInfoPage_siteListTileFontSize = 20;
// Padding
double editSiteInfoPage_siteListTileFontPadding = 10;

/// WaitingAcceptPage
// Size
int waitingAcceptPage_spacePerTitle = 30;
int waitingAcceptPage_spacePerNextBtn = 25; // Re-type 버튼 사이의 간격

/// SelectRolePage
// Size
int selectRolePage_spacePerTitle = 10; // 타이틀과의 간격
int selectRolePage_widgetSpaceRow = 6; // 버튼 사이의 가로 간격
int selectRolePage_loginBtnWidth = 37; // 역할 선택 버튼 가로
int selectRolePage_loginBtnHeight = 45; // 역할 선택 버튼 세로 패딩
int selectRolePage_spacePerBottomBtn = 20; // 타이틀과의 간격

/// HomePage
// Size
int homePage_spacePerLogo = 3; // 로고과의 간격
int homePage_spacePerTitle = 7; // 타이틀과의 간격
int homePage_spacePerBtn = 6; // 버튼 사이 간격(가로)
int homePage_smallBtnWidth = 36; // 작은 버튼 가로
int homePage_smallBtnHeight = 33; // 작은 버튼 높이
int homePage_bigBtnHeight = 45; // 큰 버튼 높이
// icon
int homePage_iconSize = 10; // 버튼 아이콘 크기
int homePage_spacePerIcon = 3; // 버튼 아이콘 간격
int homePage_iconSizeBig = 20; // 버튼 큰 아이콘 크기
int homePage_spacePerIconBig = 3; // 버튼 큰 아이콘 간격
// Weighet
double homePage_iconWeight = 3; // 버튼 아이콘 테두리 두께
// Round
double homePage_iconRound = 50;
// Font
double homePage_emergencyBtnFontSize = 20; // 긴급 버튼 폰트 크기

/// HelmetCheckPage
// Size
int helmetCheckPage_spacePerNextBtn = 15; // 넥스트 버튼과의 간격
int helmetCheckPage_progressIndicatorPadding = 35; // 로딩 크기
int helmetCheckPage_spacePerTitle = 10;

/// CheckListPage
// Size
int checkListPage_spacePerSubTitle = 10; // 서브타이틀과 컴포넌트 간격
int checkListPage_checkFormHeight = 100; // 체크 영역 높이
int checkListPage_spacePerBackBtn = 6; // 뒤로가기 버튼과의 간격
// Padding
double checkListPage_listTilePaddingTopBottom = 5; // 리스트 타일 패딩(위아래)
double checkListPage_listTilePaddingLeft = 15; // 리스트 타일 패딩(왼쪽)
// Font
double checkListPage_listTextFontSize = 15; // 리스트 텍스트 폰트 크기

/// SiteInfoPage
// Size
int siteInfoPage_spacePerTitle = 10; // 타이틀과의 간격
int siteInfoPage_mapHeight = 80; // 지도 높이
int siteInfoPage_codeWidth = 7; // 현장 코드 한 글자 너비
int siteInfoPage_codeHeight = 10; // 현장 코드 한 글자 높이
int siteInfoPage_spacePerCode = 2; // 코드 한글자 한글자 끼리의 간격
// Radius
double siteInfoPage_codeRadius = 5; // 코드 한글자 박스 둥글기
// Shadow
double siteInfoPage_codeShadowBlurRadius = 5; // 코드 한글자 그림자 번짐 정도
double siteInfoPage_codeShadowOffSer = 2; // 코드 한글자 그림자 오프셋
// Font
double siteInfoPage_codeFontSize = 20; // 코드 한글자 폰트 크기
// Width
double siteInfoPage_codeBoxWidth = 1; // 현장코드 테두리 두께

/// ManageEmpPage
// Size
int manageEmpPage_page1_spacePerTitle = 5; // 타이틀과의 간격
int manageEmpPage_page1_listFoemHeight = 80; // 리스트 공간 높이
int manageEmpPage_page1_spacePerBigBox = 10; // 두 영역 사이 간격
int manageEmpPage_page1_spacePerBtns = 15; // 버튼과의 간격
int manageEmpPage_page1_tileNameWidth = 40; // 페이지1 타일 이름 너비
int manageEmpPage_page1_tileAgeWidth = 20; // 페이지1 타일 나이 너비
int manageEmpPage_page1_tileRoleWidth = 20; // 페이지1 타일 등급 너비
int manageEmpPage_page2_spacePerTitle = 10; // 타이틀과의 간격
int manageEmpPage_page2_waiteListHeight = 80; // 체크 리스트 높이
int manageEmpPage_page2_spacePerBtns = 10; // 버튼과의 간격
int manageEmpPage_page2_spacePerBtn = 5; // 버튼끼리의 간격
int manageEmpPage_page2_tileNameWidth = 50; // 페이지2 타일 이름 너비
int manageEmpPage_page2_tileAgeWidth = 30; // 페이지2 타일 나이 너비
int manageEmpPage_pageIndicatorIconSize = 3; // 페이지 표시 아이콘 크기
int manageEmpPage_spaceTopBottom = 10; // 위 아래 여백 크기
int manageEmpPage_spacePerRole = 5; // role 드롭다운과 텍스트 사이 간격
// Padding
double manageEmpPage_listTilePaddingTopBottom = 5; // 리스트 타일 패딩(위아래)
double manageEmpPage_listTilePadding = 15; // 리스트 타일 패딩
double manageEmpPage_listTileTextPadding = 10; // 리스트 타일 내부 글자 패딩
// Font
double manageEmpPage_listTextFontSize = 15; // 리스트 텍스트 폰트 크기

/// EmergencyPage
// Size
int emergencyPage_spacePerTitle = 10; // 타이틀과의 간격
int emergencyPage_spacePerMap = 10; // 지도와의 간격
int emergencyPage_spacePerBtn = 5; // 버튼끼리의 간격
int emergencyPage_spaceBottom = 10; // 하단 간격
int emergencyPage_btms_height = 80; // 바텀시트 높이
// Padding
double emergencyPage_btms_padding = 20; // 바텀시트 패딩

/// CPR Page
// Size
int cprPage_spacePerComponent = 10; // 요소끼리 간격
int cprPage_spacePerTitleAndComponent = 3; // 타이틀과의 간격

/// ViewPeopleInfoPage
// Size
int viewPeopleInfoPage_spacePerTitle = 10; // 타이틀과의 간격
int viewPeopleInfoPage_spacePerText = 10; // 텍스트간 간격
int viewPeopleInfoPage_spacePerBottomBtn = 10; // 아래 버튼과의 간격
int viewPeopleInfoPage_spacePerBtns = 10; // 버튼끼리 간격
// Font
double viewPeopleInfoPage_fontSize = 20; // 폰트 크기
double viewPeopleInfoPage_smallFontSize = 15; // 폰트 크기
// Padding
int viewPeopleInfoPage_padding = 5; // 리스트 공간 패딩
// Shadow
double viewPeopleInfoPage_offset = 3; // 그림자 오프셋
double viewPeopleInfoPage_blueray = 3; // 그림자 번짐

/// Google Map
// Size
int googleMap_iconSize = 10;
int googleMap_markerSize = 10;

/// 화면 사이즈 대비 퍼센트 반환 함수(가로)
double getFullScrennSizePercent(BuildContext context, int percent) {
  return MediaQuery.of(context).size.width * percent / 100;
}

/// 전역변수 초기화 함수
void clearGlobalVar() {
  // Site global
  global_haveSite = false;
  global_siteId = -1;
  global_siteName = "";
  global_siteLon = 0;
  global_siteLat = 0;
  global_siteAdd1 = "";
  global_siteAdd2 = "";
  global_siteCode = "";
  // privacy global
  global_userId = -1;
  global_userRole = null;
  global_userAge = -1;
  global_userPhoneNum = "";
  global_userName = "";
}

/// 현장 전역변수 초기화 함수
void clearSiteGlobalVar() {
  // Site global
  global_haveSite = false;
  global_siteId = -1;
  global_siteName = "";
  global_siteLon = 0;
  global_siteLat = 0;
  global_siteAdd1 = "";
  global_siteAdd2 = "";
  global_siteCode = "";
}

/// ########################
/// API
/// ########################
Dio dio = Dio();
String api_hostURI = "http://3.37.75.80:8080/";
String authorization = '';
String refreshToken = '';

/// Admin
// AdminSignUp
Future<Response> api_admin_signUp(String email, String adminName,
    String adminPhoneNum, String adminAge) async {
  String uri = api_hostURI + "admin/testSignUp?email=$email";
  Map body = {
    "adminName": adminName,
    "adminPhoneNum": adminPhoneNum,
    "adminAge": int.parse(adminAge)
  };
  late Response res;
  try {
    res = await dio.post(uri, data: body);
    global_userId = res.data["data"];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 가입 실패");
    print(e);
  }
  return res;
}

// AdminLogin
Future<Response> api_admin_signIn(String email) async {
  String uri = api_hostURI + "admin/testSignIn?email=$email";
  late Response res;
  try {
    res = await dio.post(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 로그인 실패");
    print(e);
  }
  return res;
}

// logout
Future<Response> api_admin_logout() async {
  String uri = api_hostURI + "admin/logout";
  dio.options.headers = {
    'Authorization': "bearer " + authorization,
    'RefreshToken': refreshToken
  };

  late Response res;
  try {
    res = await dio.post(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 로그아웃 실패");
    print(e);
  }
  return res;
}

// getSiteInfo
Future<Response> api_admin_getSiteInfo(String email) async {
  late Response res;
  try {
    String uri = api_hostURI + "admin/getSiteInfo?email=$email";
    res = await dio.get(uri);
    global_siteId = res.data['data'];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 현장 정보 조회 실패");
    print(e);
  }
  return res;
}

// 관리자 개인 정보 조회
Future<Response> api_admin_getPrivacy(int id) async {
  late Response res;
  try {
    String uri = api_hostURI + "admin/$id";
    res = await dio.get(uri);
    global_userName = res.data['data']['adminName'];
    global_userPhoneNum = res.data['data']['adminPhoneNum'];
    global_userAge = res.data['data']['adminAge'];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 개인 정보 조회 실패");
    print(e);
  }
  return res;
}

// 관리자 정보 수정
Future<Response> api_admin_editPrivacy(
    String adminName, String adminPhoneNum, String adminAge) async {
  String uri = api_hostURI + "admin/editInfo";
  Map body = {
    "adminName": adminName,
    "adminPhoneNum": adminPhoneNum,
    "adminAge": int.parse(adminAge)
  };
  late Response res;
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 정보 수정 실패");
    print(e);
  }
  return res;
}

// 유저 목록 조회
Future<Response> api_admin_getUserList(int siteId) async {
  String uri = api_hostURI + "admin/checkHelmet/$siteId";
  late Response res;
  try {
    res = await dio.get(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 목록 조회 완료");
    print(e);
  }
  return res;
}

// 대기 유저 조회
Future<Response> api_admin_getWaitingList(int siteId) async {
  String uri = api_hostURI + "admin/acceptList/$siteId";
  late Response res;
  try {
    res = await dio.get(
      uri,
    );
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 대기 유저 목록 조회 실패");
    print(e);
  }
  return res;
}

// 유저 상세 정보 조회
Future<Response> api_admin_getUserInfo(int userId) async {
  String uri = api_hostURI + "admin/detail/$userId";
  late Response res;
  try {
    res = await dio.get(
      uri,
    );
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 유저 상세정보 조회 실패");
    print(e);
  }
  return res;
}

// 유저 등급 변경
Future<Response> api_admin_changeUserRole(int userId, String role) async {
  String uri = api_hostURI + "admin/acceptUser/$userId";
  late Response res;
  Map body = {'role': role};
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 유저 등급 변경 실패");
    print(e);
  }
  return res;
}

// 유저 현장에서 제거
Future<Response> api_admin_deleteEmp(int userId) async {
  String uri = api_hostURI + "admin/$userId";
  late Response res;
  try {
    res = await dio.delete(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 유저 제거 실패");
    print(e);
  }
  return res;
}

// 대기 유저 승인
Future<Response> api_admin_acceptWaiting(int userId) async {
  String uri = api_hostURI + "admin/acceptGuest/$userId";
  late Response res;
  try {
    res = await dio.patch(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 대기 유저 승인 실패");
    print(e);
  }
  return res;
}

// 유저 삭제
Future<Response> api_admin_deleteUser(int userId) async {
  String uri = api_hostURI + "admin/$userId";
  late Response res;
  try {
    res = await dio.delete(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###관리자 유저 삭제 실패");
    print(e);
  }
  return res;
}

/// User
// UserSignUp
Future<Response> api_user_signUp(
    String email, String userName, String userPhoneNum, String userAge) async {
  String uri = api_hostURI + "user/testSignUp?email=$email";
  Map body = {
    "userName": userName,
    "userPhoneNum": userPhoneNum,
    "userAge": int.parse(userAge)
  };
  late Response res;
  try {
    res = await dio.post(uri, data: body);
    global_userId = res.data["data"];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(e);
    print(">>> ###유저 가입 실패");
    print(e);
  }
  return res;
}

// UserLogin
Future<Response> api_user_signIn(String email) async {
  String uri = api_hostURI + "user/testSignIn?email=$email";
  late Response res;
  try {
    res = await dio.post(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 로그인 실패");
    print(e);
  }
  return res;
}

// logout
Future<Response> api_user_logout() async {
  String uri = api_hostURI + "user/logout";
  dio.options.headers = {
    'Authorization': "bearer " + authorization,
    'RefreshToken': refreshToken
  };
  late Response res;
  try {
    res = await dio.post(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 로그아웃 실패");
    print(e);
  }
  return res;
}

// getSiteInfo
Future<Response> api_user_getSiteInfo(String email) async {
  String uri = api_hostURI + "user/getSiteInfo?email=$email";
  late Response res;
  try {
    res = await dio.get(uri);
    global_siteId = res.data['data'];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 현장 정보 조회 실패");
    print(e);
  }
  return res;
}

// 유저 개인 정보 조회
Future<Response> api_user_getPrivacy(int id) async {
  late Response res;
  try {
    String uri = api_hostURI + "user/$id";
    res = await dio.get(uri);
    global_userName = res.data['data']['userName'];
    global_userPhoneNum = res.data['data']['userPhoneNum'];
    global_userAge = res.data['data']['userAge'];
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 개인 정보 조회 실패");
    print(e);
  }
  return res;
}

// 유저 정보 수정
Future<Response> api_user_editPrivacy(
    String userName, String userPhoneNum, String userAge) async {
  String uri = api_hostURI + "user/editInfo";
  Map body = {
    "userName": userName,
    "userPhoneNum": userPhoneNum,
    "userAge": int.parse(userAge)
  };
  late Response res;
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 개인 정보 수정 실패");
    print(e);
  }
  return res;
}

// inputCheckCode
Future<Response> api_user_returnCheckCode(String checkCode) async {
  String uri = api_hostURI + "user/acceptSite";
  Map body = {"siteCode": checkCode};
  late Response res;
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 현장 코드 제출 실패");
    print(e);
  }
  return res;
}

// cancleCheckCode
Future<Response> api_user_cancleCheckCode(int userId) async {
  String uri = api_hostURI + "user/cancelAccept/$userId";
  late Response res;
  try {
    res = await dio.patch(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 승인 대기 취소 실패");
    print(e);
  }
  return res;
}

// 안전모 체크 여부 조회
Future<Response> api_user_getHelmetCheck() async {
  String uri = api_hostURI + "user/helmetCheck";
  late Response res;
  try {
    res = await dio.get(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###유저 헬멧 체크 여부 조회 실패");
    print(e);
  }
  return res;
}

// 안전모 체크 여부 수정
Future<Response> api_user_editHelmetCheck(bool state) async {
  String uri = api_hostURI + "user/editHelmet";
  late Response res;
  Map body = {'helmetCheck': state};
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(e);
    print(">>> ###유저 헬멧 체크 여부 변경 실패");
    print(e);
  }
  return res;
}

/// Site
// getSiteInfo
Future<Response> api_site_getSiteInfo(int siteId) async {
  String uri = api_hostURI + "site/$siteId";
  late Response res;
  try {
    res = await dio.get(
      uri,
    );
    global_siteCode = res.data['data']['siteCode'];
    global_siteName = res.data['data']['siteName'];
    global_siteLat = res.data['data']['siteLatitude'];
    global_siteLon = res.data['data']['siteLongitude'];
    global_siteAdd1 = res.data['data']['address1'];
    global_siteAdd2 = res.data['data']['address2'];
    print(">>> ${res.data['successResponseMessage']}");

    // 행정구역 이름 변경
    switch (global_siteAdd1) {
      case ("충남"):
        global_siteAdd1 = "충청남도";
        break;
      case ("충북"):
        global_siteAdd1 = "충청북도";
        break;
      case("전남"):
        global_siteAdd1 = "전라남도";
        break;
      case("전북"):
        global_siteAdd1 = "전라북도";
        break;
      case("경남"):
        global_siteAdd1 = "경상남도";
        break;
      case("경북"):
        global_siteAdd1 = "경상북도";
        break;
    }
  } catch (e) {
    print(">>> ###현장 정보 조회 실패");
    print(e);
  }
  return res;
}

// CreateSite
Future<Response> api_site_createSite(String siteName, double latitude,
    double longitude, String address1, String address2) async {
  String uri = api_hostURI + "site/createSite";
  Map createSiteBody = {
    "siteName": siteName,
    "siteLatitude": latitude,
    "siteLongitude": longitude,
    "address1": address1,
    "address2": address2,
  };
  late Response res;
  try {
    res = await dio.post(uri, data: createSiteBody);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###현장 생성 실패");
    print(e);
  }
  return res;
}

// 현장 정보 수정
Future<Response> api_site_editSite(int siteId, String siteName, double latitude,
    double longitude, String address1, String address2) async {
  String uri = api_hostURI + "site/$siteId";
  Map createSiteBody = {
    "siteName": siteName,
    "siteLatitude": latitude,
    "siteLongitude": longitude,
    "address1": address1,
    "address2": address2,
  };
  late Response res;
  try {
    res = await dio.patch(uri, data: createSiteBody);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###현장 정보 수정 실패");
    print(e);
  }
  return res;
}

// 현장 정보 삭제
Future<Response> api_site_deleteSite(int siteId) async {
  String uri = api_hostURI + "site/$siteId";
  late Response res;
  try {
    res = await dio.delete(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###현장 제거 실패");
    print(e);
  }
  return res;
}

// 현장 코드 유효 여부 조회
Future<Response> api_site_vaildCheck(String siteCode) async {
  String uri = api_hostURI + "site/valid/$siteCode";
  late Response res;
  try {
    res = await dio.get(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###현장 코드 유효 여부 조회 실패");
    print(e);
  }
  return res;
}

// 현장 초기화
Future<Response> api_site_clearSite(int siteId) async {
  String uri = api_hostURI + "site/workStart/$siteId";
  late Response res;
  try {
    res = await dio.patch(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###현장 상태 초기화 실패");
    print(e);
  }
  return res;
}

/// SiteCheck
// 체크리스트 목록 조회
Future<Response> api_siteCheck_getCheckList(int siteId) async {
  String uri = api_hostURI + "siteCheck/list/$siteId";
  late Response res;
  try {
    res = await dio.get(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###체크리스트 목록 조회 실패");
    print(e);
  }
  return res;
}

// 체크리스트 생성
Future<Response> api_siteCheck_addCheckList(int siteId, String msg) async {
  String uri = api_hostURI + "siteCheck/createCheck";
  late Response res;
  Map body = {'siteId': siteId, 'siteQuestion': msg};
  try {
    res = await dio.post(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###체크리스트 생성 실패");
    print(e);
  }
  return res;
}

// 체크리스트 수정
Future<Response> api_siteCheck_editCheckList(int checkId, String msg) async {
  String uri = api_hostURI + "siteCheck/question/$checkId";
  late Response res;
  Map body = {'question': msg};
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###체크리스트 수정 실패");
    print(e);
  }
  return res;
}

// 체크리스트 삭제
Future<Response> api_siteCheck_deleteCheckList(int checkId) async {
  String uri = api_hostURI + "siteCheck/$checkId";
  late Response res;
  try {
    res = await dio.delete(uri);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###체크리스트 제거 실패");
    print(e);
  }
  return res;
}

// 체크리스트 상태 수정
Future<Response> api_siteCheck_editAnswer(int checkId, bool answer) async {
  String uri = api_hostURI + "siteCheck/answer/${checkId}";
  late Response res;
  Map body = {'answer': answer};
  try {
    res = await dio.patch(uri, data: body);
    print(">>> ${res.data['successResponseMessage']}");
  } catch (e) {
    print(">>> ###체크리스트 상태 수정 실패");
    print(e);
  }
  return res;
}
