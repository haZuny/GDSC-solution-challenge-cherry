import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:cherry_app/AppBar_Drawer.dart';
import 'package:cherry_app/All_HomePage.dart';
import 'package:cherry_app/baseFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:transition/transition.dart';

class CPRPage extends StatefulWidget {
  @override
  State<CPRPage> createState() => _CPRPage();
}

class _CPRPage extends State<CPRPage> with WidgetsBindingObserver {
  AudioPlayer audio = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    audio.setReleaseMode(ReleaseMode.loop);
    audio.play(
      AssetSource('sound/cpr.ogg'),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audio.stop();
    audio.release();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        audio.resume();
        break;
      case AppLifecycleState.inactive:
        print("inactive");
        break;
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Scaffold(
          appBar: AppBarAll(),
          drawer: DrawerAll(),

          /// bottom bar
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height:
                  getFullScrennSizePercent(context, bottomBar_bottomBarHeight),
            ),
            shape: CircularNotchedRectangle(),
            color: Color(themaColor_white),
            notchMargin:
                getFullScrennSizePercent(context, bottomBar_bottomBarNorch),
          ),

          /// floating btn
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
                bottom: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnMargin)),
            child: FloatingActionButton(
              child: Icon(
                Icons.home,
                size: getFullScrennSizePercent(
                    context, bottomBar_floatingBtnSize),
              ),
              backgroundColor: Color(themaColor_yellow),
              onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context, Transition(child: HomePageAll()), (_) => false);
              },
            ),
          ),

          /// floating btn location
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          /// body
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: InteractiveViewer(
                maxScale: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// 위, 아래 공간
                    Container(
                      height:
                          getFullScrennSizePercent(context, allPage_spaceTopDown),
                    ),

                    /// 타이틀
                    Text(
                      "The step of CPR",
                      style: TextStyle(
                        fontSize: allPage_titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /// 타이틀과 서브타이틀 사이 공간
                    Container(
                      height: getFullScrennSizePercent(
                          context, allPage_spacePerTitleAndSubTitme),
                    ),

                    /// 서브타이틀
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      alignment: Alignment.center,
                      child: Text(
                        "E m e r g e n c y",
                        style: TextStyle(
                          color: Color(themaColor_white),
                          fontSize: allPage_subTitleFontSize,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(themaColor_red),
                          borderRadius:
                              BorderRadius.circular(allPage_subTitleLineRadius)),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// 전체 과정 이미지
                    Image.asset("assets/img/cpr_steps.jpg"),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step1
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 1. Call 911",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Text(
                            "First, check the scene for factors that could put you in danger, such as traffic, fire, or falling masonry. Next, check the person. Do they need help? Tap their shoulder and shout, \“Are you OK?\”\n\nIf they are not responding, call 911 or ask a bystander to call 911 before performing CPR. If possible, ask a bystander to go and search for an AED machine. People can find these in offices and many other public buildings.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step2
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 2. Place the person on their back and open their airway",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Text(
                            "Place the person carefully on their back and kneel beside their chest. Tilt their head back slightly by lifting their chin.\n\nOpen their mouth and check for any obstruction, such as food or vomit. Remove any obstruction if it is loose. If it is not loose, trying to grasp it may push it farther into the airway.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step3
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 3. Check for breathing",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Text(
                            "Place your ear next the person’s mouth and listen for no more than 10 seconds. If you do not hear breathing, or you only hear occasional gasps, begin CPR.\n\nIf someone is unconscious but still breathing, do not perform CPR. Instead, if they do not seem to have a spinal injury, place them in the recovery position. Keep monitoring their breathing and perform CPR if they stop breathing.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step4
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 4. Perform 30 chest compressions",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Image.asset("assets/img/cpr_compressing.jpg"),
                          Text(
                            "Place one of your hands on top of the other and clasp them together. With the heel of the hands and straight elbows, push hard and fast in the center of the chest, slightly below the nipples.\n\nPush at least 2 inches deep. Compress their chest at a rate of least 100 times per minute. Let the chest rise fully between compressions.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step5
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 5. Perform two rescue breaths",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Image.asset("assets/img/cpr_breath.jpg"),
                          Text(
                            "Making sure their mouth is clear, tilt their head back slightly and lift their chin. Pinch their nose shut, place your mouth fully over theirs, and blow to make their chest rise.\n\nIf their chest does not rise with the first breath, retilt their head. If their chest still does not rise with a second breath, the person might be choking.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 간격
                    Container(
                      height: getFullScrennSizePercent(
                          context, cprPage_spacePerComponent),
                    ),

                    /// Step6
                    Container(
                      width: getFullScrennSizePercent(
                          context, allPage_mainComponentsWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 6. Repeat",
                            style: TextStyle(
                                fontSize: allPage_titleFontSize,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(themaColor_red),
                                color: Color(themaColor_white)),
                          ),
                          Container(
                            height: getFullScrennSizePercent(
                                context, cprPage_spacePerTitleAndComponent),
                          ),
                          Text(
                            "Repeat the cycle of 30 chest compressions and two rescue breaths until the person starts breathing or help arrives. If an AED arrives, carry on performing CPR until the machine is set up and ready to use.",
                            style: TextStyle(fontSize: allPage_subTitleFontSize),
                          ),
                        ],
                      ),
                    ),

                    /// 위, 아래 공간
                    Container(
                      height:
                          getFullScrennSizePercent(context, allPage_spaceTopDown),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
