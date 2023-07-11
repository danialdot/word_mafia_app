import 'package:word_mafia_app/controller/app_config.dart';
import 'package:word_mafia_app/core/constants.dart';
import 'package:word_mafia_app/model/local/hive.dart';
import 'package:word_mafia_app/view/page/game/setup_page.dart';
import 'package:word_mafia_app/view/page/welcome/server_not_responding.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AppConfigController _appConfigontroller = AppConfigController();
  late bool _loadingStaus = false;
  late String _version = "Unknown";

  void _initPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;

    setState(() {
      _version = version;
    });
  }

  Future _verificationsWithcustomeDelay() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!_loadingStaus) await _checkHive();
    if (!_loadingStaus) await _checkIfServerIsReachable();
  }

  Future _checkHive() async {
    var isServerOkay = await _appConfigontroller.checkIfServerIsReachable();
    if (!context.mounted) return;
    final HiveControlle hiveControlle = HiveControlle();
    var url = Uri.parse(AppUrl.getAllWords);
    if (await hiveControlle.hasCachedData(url.toString())) {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SetupPage(),
        ),
      );
      _loadingStaus = true;
    }
  }

  Future _checkIfServerIsReachable() async {
    var isServerOkay = await _appConfigontroller.checkIfServerIsReachable();
    if (!context.mounted) return;
    if (!isServerOkay) {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ServerNotRespondingPage(),
        ),
      );
      _loadingStaus = true;
    } else {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SetupPage(),
        ),
      );
      _loadingStaus = true;
    }
  }

  @override
  void initState() {
    _initPackageInfo();
    _verificationsWithcustomeDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.customNavyBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              maxLines: 1,
              textAlign: TextAlign.center,
              AppText.splashWelcome,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColor.customWhiteText,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 24),
          Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            _version,
            style: const TextStyle(
              fontSize: 10,
              color: AppColor.customWhiteText,
            ),
          ),
        ],
      ),
    );
  }
}
