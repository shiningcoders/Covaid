import 'package:flutter/material.dart';

class GlintUI {
  static final Color red = Color(0xffF50C52);
  static final Color yellow = Color(0xffFFC700);
  static final Color blue = Color(0xff00D1FF);
  static final Color purple = Color(0xff8F03FD);
  static final Color darkGrey = Color(0xff626262);
  static final Color boldGrey = Color(0xff707070);
  static final Color midGrey = Color(0xff979797);
  static final Color lightGrey = Color(0xffF6F6F6);
  static final Color green = Color(0xff0CF5AF);
  static final Color darkScaffold = Color(0xff16171C);
  static final Color scaffold = Color(0xffF5F5F5);
  static final Color transparent = Colors.transparent;

  // == WHEEZ COLORS ==

  static final Color wheezPurple = Color(0xff9E11FF);
  static final Color wheezVoilet = Color(0xffD53BFF);
  static final Color wheezBlue = Color(0xff1DD8DB);
  static final Color wheezPink = Color(0xffFA80C5);
  static final List<Color> wheezGrey = [
    Color(0xffF5F5F5),
    Color(0xffE3E3E3),
    Color(0xffA7A7A7),
    Color(0xff707070),
  ];

  //==[Covaid Colors]==//

  static final Color covaidPurple = Color(0xff7433FF);
  static final Color covaidPink = Color(0xffFFACFD);
  static final List<Color> covaidGrey = [
    Color(0xffE3E3E3),
    Color(0xff949494),
    Color(0xff6C6C6C),
    Color(0xff484848),
  ];

  //===[GRADIENTS]===

  static final LinearGradient wheezPurpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      wheezVoilet,
      wheezPurple,
    ],
  );

  static final LinearGradient redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFF7777),
      Color(0xffFF0366),
    ],
  );

  static final LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFED856),
      Color(0xffFFC421),
    ],
  );

  static final LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff72D0FF),
      Color(0xff72D0FF),
      Color(0xff72D0FF),
      Color(0xff80C4FF),
    ],
  );

  static final LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffD53BFF),
      Color(0xff8C03FF),
    ],
  );

  static final LinearGradient transparentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
    ],
  );

  // == Constants

  static final double sideMargin = 65.0;

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static shortestSide(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide;
  }
}

enum ScreenSize { Mobile, Tablet, Desktop, Watch }

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

ScreenSize getFormFactor(BuildContext context) {
  // Use .shortestSide to detect device type regardless of orientation
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > FormFactor.desktop) return ScreenSize.Desktop;
  if (deviceWidth > FormFactor.tablet) return ScreenSize.Tablet;
  if (deviceWidth > FormFactor.handset) return ScreenSize.Mobile;
  return ScreenSize.Watch;
}
