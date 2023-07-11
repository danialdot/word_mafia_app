import 'dart:math';

import 'package:word_mafia_app/controller/words_controller.dart';
import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_mafia_app/model/remote/words/words.dart';
import 'package:word_mafia_app/view/page/custom_scaffold.dart';
import 'package:word_mafia_app/view/page/game/timer_page.dart';
import 'package:word_mafia_app/view/widget/components.dart';

class WordsPage extends StatefulWidget {
  final int totalPlayers;
  final int totalMafias;
  final int timerCounter;

  const WordsPage({
    Key? key,
    required this.totalPlayers,
    required this.totalMafias,
    required this.timerCounter,
  }) : super(key: key);

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  late List<bool> _isMafiaTracker = List.generate(widget.totalPlayers, (_) => false);
  final WordsController _wordsController = WordsController();
  late int _randomIndexWord = 0;
  late int _totalMafias = 0;
  late int _playerTracker = 0;
  late bool _showCard = false;

  void _generateRandomNumber() async {
    Random random = Random();
    int randomNumber = random.nextInt(_wordsController.wordsModelAction.words.length);

    setState(() {
      _randomIndexWord = randomNumber;
    });
  }

  void _generateRandomMafias() async {
    Random random = Random();
    while (_totalMafias != widget.totalMafias) {
      int randomNumber = random.nextInt(widget.totalPlayers);
      if (!_isMafiaTracker[randomNumber]) {
        setState(() {
          _isMafiaTracker[randomNumber] = true;
          _totalMafias = _totalMafias + 1;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _wordsController.getWords();
    _generateRandomMafias();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageBody: SingleChildScrollView(
        child: Obx(() {
          if (_wordsController.status == pageState.loaded) {
            if (_randomIndexWord == 0) {
              Future.delayed(Duration(milliseconds: 50), () {
                if (this.mounted) {
                  _generateRandomNumber();
                }
              });
              return Container(
                color: Colors.transparent,
              );
            } else {
              return _wordWidget(_wordsController.wordsModelAction);
            }
          } else if (_wordsController.status == pageState.error) {
            return Center(
              child: Text(
                _wordsController.error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.transparent,
            );
          }
        }),
      ),
    );
  }

  Widget _wordWidget(WordsModel wordsModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 20,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              if (_showCard) {
                if (_playerTracker < widget.totalPlayers) {
                  setState(() {
                    _playerTracker = _playerTracker + 1;
                  });
                }
                setState(() {
                  _showCard = !_showCard;
                });
              } else {
                setState(() {
                  _showCard = !_showCard;
                });
              }
              if (_playerTracker >= widget.totalPlayers) {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerPage(
                      timerCounter: widget.timerCounter,
                    ),
                  ),
                );
              }
            },
            child: _playerTracker != _isMafiaTracker.length
                ? customWordCard(
                    context: context,
                    word: _isMafiaTracker[_playerTracker] ? AppText.youAreTheMafia : wordsModel.words[_randomIndexWord],
                    showCard: _showCard,
                  )
                : Container(
                    color: Colors.transparent,
                  ),
          ),
        ),
      ],
    );
  }
}
