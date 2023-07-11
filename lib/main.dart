import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:word_mafia_app/view/page/welcome/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Academy Engraved LET'),
      title: AppText.appName,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
