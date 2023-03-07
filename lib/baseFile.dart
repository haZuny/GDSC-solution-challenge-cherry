import 'package:flutter/cupertino.dart';

/// var
// SignUp logic, 회원가입시 어느 페이지 선택했는지 결정
enum SignUpClass{manager, employee}
SignUpClass? global_signUpClass;

/// 공통
// Color
int themaColor_white = 0xFFFFFFFF; // 하얀색
int themaColor_black = 0xFF000000;  // 검정색
int themaColor_whiteBlack = 0xff909090; // 연한 검정
int allPage_btnFontColor = 0xff2378b7; // 텍스트버튼 컬러
int allPage_btnSubFontColor = 0xff965454; // 텍스트버튼 서브 컬러
// Size(Percent)
int allPage_spacePerTitleAndComponents = 15; // 타이틀과 컴포넌트 사이의 간격
int allPage_mainComponentsWidth = 80; // 컴포넌트 너비
// int allPage_signUpTFHeight = 15;  // 회원가입 텍스트필드 세로
// Radius
double allPage_btnRadius = 10;  // 버튼 둥글기
double allPage_TFRadius = 10;  // 텍스트필드 둥글기
double allPage_bigBoxRadious = 20;  // 큰 박스 둥글기
// Width(두께)
double allPage_btnBorderWidth = 0.1;  // 버튼 테두리
// FontSize
double allPage_titleFontSize = 25;  // 타이틀 폰트 크기
double allPage_subTitleFontSize = 17;  // 서브 타이틀 폰트 크기
double allPage_btnFontSize = 18;  // 텍스트 버튼 폰트 크기
// Shadow
double allPage_shadowBlurRadius = 10;
double allPage_shadowOffSet = 5;

/// AppBar, Drawer
// drawer
int drawer_spaceTop = 10;
double drawer_dividerWidth = 0.2;
double drawer_dividerHeight = 0;

/// SignInPage
// Size(Percent)
int signInPage_logoWidth = 70;  // 로고 가로 크기
int signInPage_spacePerLogo = 20; // 로고와의 간격
int signInPage_loginBtnHeight = 15;  // 로그인 버튼 세로
int siginInPage_googleLogoSize_width = 8; // 구글 로그 사이즈
int siginInPage_googleLogoFontColor = 0xffb4b4b4; // 구글 로그 사이즈
// Width(두께)
double signInPage_loginBtnBorderWidth = 0.1;

/// SignUpPage
// Size
int signUpPage_spacePerTFs = 5; // 텍스트 필드 사이의 간격
int signUpPage_spacePerNextBtn = 5; // 넥스트 버튼 사이의 간격

/// PutCheckCodePage
// Size
int putCheckCodePage_spacePerNextBtn = 25; // 넥스트 버튼 사이의 간격
double putCheckCodePage_checkBtnFontSize = 14;  // 체크 버튼 폰트 크기

/// PutSiteInfoPage
// Size
int putSiteInfoPage_spacePerTFs = 5; // 텍스트 필드 사이의 간격
int putSiteInfoPage_spacePerNextBtn = 20; // 넥스트 버튼과의 간격
int putSiteInfoPage_containerPadding = 10;  // 바텀시트 패딩
double putSiteInfoPage_bottomsheetHeight = 0.6; // 바텀 시트 크기(세로)
// Font
double putSiteInfoPage_siteListTileFontSize = 20;
// Padding
double putSiteInfoPage_siteListTileFontPadding = 10;

/// WaitingAcceptPage
// Size
int waitingAcceptPage_spacePerNextBtn = 35; // Re-type 버튼 사이의 간격

/// SelectRolePage
// Size
int selectRolePage_widgetSpaceRow = 6; // 버튼 사이의 가로 간격
int selectRolePage_loginBtnWidth = 37;  // 역할 선택 버튼 가로
int selectRolePage_loginBtnHeight = 45;  // 역할 선택 버튼 세로 패딩

/// HomePage
// Size
int homePage_spacePerLogo = 3; // 로고과의 간격
int homePage_spacePerTitle = 7; // 타이틀과의 간격
int homePage_spacePerBtn = 6; // 버튼 사이 간격(가로)
int homePage_smallBtnWidth = 37;  // 작은 버튼 가로
int homePage_smallBtnHeight = 30; // 작은 버튼 높이
int homePage_bigBtnHeight = 45; // 큰 버튼 높이
// Font
double homePage_emergencyBtnFontSize = 20;  // 긴급 버튼 폰트 크기

/// HelmetCheckPage
// Size
int helmetCheckPage_spacePerNextBtn = 20; // 넥스트 버튼과의 간격

/// CheckListPage
// Size
int checkListPage_checkFormHeight = 100;  // 체크 영역 높이
int checkListPage_spacePerBackBtn = 6;  // 뒤로가기 버튼과의 간격
// Padding
double checkListPage_listTilePaddingTopBottom = 5;  // 리스트 타일 패딩(위아래)
double checkListPage_listTilePaddingLeft = 15;  // 리스트 타일 패딩(왼쪽)
double checkListPage_dialogTextPadding = 20;  // 다이얼로그 텍스트 패딩
// Font
double checkListPage_listTextFontSize = 15; // 리스트 텍스트 폰트 크기

/// SiteInfoPage
// Size
int siteInfoPage_spacePerTitle = 10;    // 타이틀과의 간격
int siteInfoPage_mapHeight = 110;   // 지도 높이
int siteInfoPage_codeWidth = 7;    // 현장 코드 한 글자 너비
int siteInfoPage_codeHeight = 10;   // 현장 코드 한 글자 높이
int siteInfoPage_spacePerCode = 2;  // 코드 한글자 한글자 끼리의 간격
// Radius
double siteInfoPage_codeRadius = 5; // 코드 한글자 박스 둥글기
// Shadow
double siteInfoPage_codeShadowBlurRadius = 5;   // 코드 한글자 그림자 번짐 정도
double siteInfoPage_codeShadowOffSer = 2;   // 코드 한글자 그림자 오프셋
// Font
double siteInfoPage_codeFontSize = 20;  // 코드 한글자 폰트 크기

/// ManageEmpPage
// Size
int manageEmpPage_page1_spacePerTitle = 5;    // 타이틀과의 간격
int manageEmpPage_page1_checkedFoemHeight = 80;   // 체크된 사람 공간 높이
int manageEmpPage_page1_uncheckedFoemHeight = 50; // 체크 안된 사람 공간 높이
int manageEmpPage_page1_spacePerBigBox = 10;  // 두 영역 사이 간격
int manageEmpPage_page2_spacePerTitle = 10;  // 타이틀과의 간격
int manageEmpPage_page2_waiteListHeight = 110;  // 타이틀과의 간격
int manageEmpPage_pageIndicatorIconSize = 5;    // 페이지 표시 아이콘 크기
// Padding
double manageEmpPage_listTilePaddingTopBottom = 5;  // 리스트 타일 패딩(위아래)
double manageEmpPage_listTilePadding = 15;  // 리스트 타일 패딩
// Font
double manageEmpPage_listTextFontSize = 15; // 리스트 텍스트 폰트 크기

/// ViewPeopleInfoPage
// Size
int viewPeopleInfoPage_spacePerText = 10;   // 텍스트간 간격
int viewPeopleInfoPage_spacePerBottomBtn = 30;   // 아래 버튼과의 간격
int viewPeopleInfoPage_spacePerBtns = 10;   // 버튼끼리 간격
// Font
double viewPeopleInfoPage_fontSize = 20;   // 폰트 크기

/// EmergencyPage
// Size
int emergencyPage_spacePerTitle = 3;    // 타이틀과의 간격
int emergencyPage_spacePerMap = 10; // 지도와의 간격
int emergencyPage_spacePerTextBtn = 0; // 버튼끼리의 간격


/// 화면 사이즈 대비 퍼센트 반환 함수(가로)
// double getFullScrennSizePercent(BuildContext context, int percent, bool isWidth){
//   if (isWidth)
//     return MediaQuery.of(context).size.width * percent / 100;
//   else
//     return MediaQuery.of(context).size.height * percent / 100;
// }
double getFullScrennSizePercent(BuildContext context, int percent){
    return MediaQuery.of(context).size.width * percent / 100;
}