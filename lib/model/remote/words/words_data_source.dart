import 'dart:convert';
import 'package:word_mafia_app/core/constants.dart';
import 'package:word_mafia_app/model/local/hive.dart';
import 'package:word_mafia_app/model/remote/words/words.dart';
import 'package:word_mafia_app/model/remote/utils.dart';
import 'package:http/http.dart' as http;

Future<WordsModel> wordsRemoteDataSource() async {
  final HiveControlle hiveControlle = HiveControlle();

  var url = Uri.parse(AppUrl.getAllWords);
  Map<String, String> headers = await restHeaders();

  if (await hiveControlle.hasCachedData(url.toString())) {
    final cachedData = await hiveControlle.getCachedItemByUrl(url.toString());
    // Use the cached data
    return WordsModel.fromJson(json.decode(cachedData));
  }

  var response = await http.get(
    url,
    headers: headers,
  );
  if (response.statusCode == 200) {
    // cache data
    hiveControlle.cacheApiResponse(url.toString(), response.body);
    return WordsModel.fromJson(json.decode(response.body));
  } else {
    throw FormatException(
      (jsonDecode(response.body.toString())),
    );
  }
} 