import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';

class ServerNotRespondingPage extends StatefulWidget {
  const ServerNotRespondingPage({Key? key}) : super(key: key);

  @override
  State<ServerNotRespondingPage> createState() => _ServerNotRespondingPageState();
}

class _ServerNotRespondingPageState extends State<ServerNotRespondingPage> {
  @override
  void initState() {
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
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 44,
              // bottom: MediaQuery.of(context).size.height / 22,
              right: MediaQuery.of(context).size.width / 6,
              left: MediaQuery.of(context).size.width / 6,
            ),
            child: const Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              AppText.serverInternalErrorTitle,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColor.customWhiteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
