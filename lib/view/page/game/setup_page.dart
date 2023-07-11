import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:word_mafia_app/view/page/custom_scaffold.dart';
import 'package:word_mafia_app/view/page/game/words_page.dart';
import 'package:word_mafia_app/view/widget/components.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  late int _totalPlayers = 2;
  late int _totalMafias = 1;
  late int _timerCounter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageBody: SingleChildScrollView(
        child: _setupWidget(),
      ),
    );
  }

  Widget _setupWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 20,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
          ),
          child: const Text(
            AppText.totalPlayers,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: AppColor.customWhiteText,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_totalPlayers > 2) _totalPlayers = _totalPlayers - 1;
                });
              },
              child: Icon(
                Icons.arrow_downward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            Text(
              _totalPlayers.toString(),
              style: const TextStyle(
                fontSize: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _totalPlayers = _totalPlayers + 1;
                });
              },
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 20,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
          ),
          child: const Text(
            AppText.totalMafias,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: AppColor.customWhiteText,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_totalMafias > 1) _totalMafias = _totalMafias - 1;
                });
              },
              child: Icon(
                Icons.arrow_downward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            Text(
              _totalMafias.toString(),
              style: const TextStyle(
                fontSize: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _totalMafias = _totalMafias + 1;
                });
              },
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 20,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
          ),
          child: const Text(
            AppText.timer,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: AppColor.customWhiteText,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_timerCounter > 1) _timerCounter = _timerCounter - 1;
                });
              },
              child: Icon(
                Icons.arrow_downward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            Text(
              _timerCounter.toString(),
              style: const TextStyle(
                fontSize: 42,
                color: AppColor.customWhiteText,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _timerCounter = _timerCounter + 1;
                });
              },
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 42,
                color: AppColor.customWhiteText,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Padding(
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
                  builder: (context) => WordsPage(
                    totalPlayers: _totalPlayers,
                    totalMafias: _totalMafias,
                    timerCounter: _timerCounter,
                  ),
                ),
              );
            },
            child: customBlueGrayButton(
              context: context,
              text: AppText.start,
            ),
          ),
        ),
      ],
    );
  }
}
