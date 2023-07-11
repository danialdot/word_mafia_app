import 'package:flutter/material.dart';

enum pageState { loading, loaded, error, initial }

class AppText {
  static const String appName = "word mafia";
  static const String splashWelcome = "welcome to $appName";
  static const String startingAGame = "starting a game";
  static const String start = "start";
  static const String finish = "finish";
  static const String notConnectedToTheInternetTitle = "متصل نبودن به اینترنت";
  static const String serverInternalErrorTitle = "متاسفانه مشکل فنی رخ داده است";
  static const String totalPlayers = "total players :";
  static const String totalMafias = "total mafias :";
  static const String timer = "timer :";
  static const String youAreTheMafia = "you are the mafia";
}

class AppKey {}

class AppInputLength {
  static const int name = 100;
  static const int phoneNumber = 11;
}

class LocalKey {
  static const String refreshToken = 'REFRESHTOKEN';
  static const String accessToken = 'ACCESSTOKEN';
}

class AppUrl {
  static const String base = "https://raw.githubusercontent.com/danialdot/word-mafia-data/main";
  static const String imagePrefix = "$base";
  static const String baseWords = "$base/words";
  static const String checkIfServerIsReachable = "https://github.com";
  static const String getAllWords = "$baseWords/all-words.json";
}

class AppImage {
  static const String BackCardVector = "assets/back-card.png";
}

class AppColor {
  static const Color customBlueGray = Color(0xff526D82);
  static const Color customNavyBlue = Color(0xff323949);
  static const Color customCharcoalGray = Color(0xff212129);

  static const Color customWhiteBackground = Color(0xffffffff);
  static const Color customWhiteText = Color(0xffffffff);
  static const Color customGreyText = Color(0xff494949);
  static const Color customGreyBorder = Color(0xff494949);
  static const Color customLightGreyText = Color(0xff79747E);
  static const Color customBlackText = Color(0xff000000);
}

class AppShadow {
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 3,
      offset: Offset(0, 1),
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Color(0x4C000000),
      blurRadius: 2,
      offset: Offset(0, 2),
      spreadRadius: 0,
    )
  ];
}
