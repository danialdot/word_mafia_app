import 'package:word_mafia_app/model/remote/words/words.dart';
import 'package:word_mafia_app/model/remote/words/words_data_source.dart';
import 'package:get/get.dart';
import 'package:word_mafia_app/core/constants.dart';

class WordsController extends GetxController {
  Rx<pageState> status = pageState.initial.obs;
  late WordsModel wordsModelAction;
  String error = '';

  void getWords() async {
    status(pageState.loading);
    try {
      var response = await wordsRemoteDataSource();
      wordsModelAction = response;
      status(pageState.loaded);
    } on FormatException catch (e) {
      error = e.message;
      status(pageState.error);
    }
  }
}
