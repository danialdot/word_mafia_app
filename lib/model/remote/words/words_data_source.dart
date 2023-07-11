import 'dart:convert';
import 'package:word_mafia_app/core/constants.dart';
import 'package:word_mafia_app/model/remote/words/words.dart';
import 'package:word_mafia_app/model/remote/utils.dart';
import 'package:http/http.dart' as http;

Future<WordsModel> wordsRemoteDataSource() async {
  var url = Uri.parse(AppUrl.getAllWords);
  Map<String, String> headers = await restHeaders();
  var response = await http.get(
    url,
    headers: headers,
  );
  if (response.statusCode == 200) {
    return WordsModel.fromJson(json.decode(response.body));
  } else {
    throw FormatException(
      (jsonDecode(response.body.toString())),
    );
  }
}
