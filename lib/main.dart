import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:word_mafia_app/model/local/hive_api_response.dart';
import 'package:word_mafia_app/view/page/welcome/splash_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter(
      ApiResponseBoxAdapter(),
    ); //ApiResponseBoxAdapter will be auto generated with the previous step command
  }

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
