import 'dart:async';

import 'package:flutter/material.dart';
import 'package:word_mafia_app/core/constants.dart';
import 'package:word_mafia_app/view/page/custom_scaffold.dart';
import 'package:word_mafia_app/view/page/game/setup_page.dart';
import 'package:word_mafia_app/view/widget/components.dart';

class TimerPage extends StatefulWidget {
  final int timerCounter;

  const TimerPage({
    Key? key,
    required this.timerCounter,
  }) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? countdownTimer;
  late Duration myDuration = Duration(minutes: widget.timerCounter);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return CustomScaffold(
      pageBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$hours:$minutes:$seconds',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.customWhiteText,
                fontSize: 50,
              ),
            ),
          ),
          (myDuration.inSeconds == 0) ? Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.width / 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetupPage(),
                  ),
                );
              },
              child: customBlueGrayButton(
                context: context,
                text: AppText.finish,
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
