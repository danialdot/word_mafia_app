import 'package:word_mafia_app/model/local/hive_api_response.dart';
import 'package:hive/hive.dart';

class HiveControlle {
  final String _boxName = "apis";

  Future<bool> hasCachedData(String url) async {
    final box = await Hive.openBox(_boxName);
    return box.containsKey(url);
  }

  Future<String> getCachedItemByUrl(String url) async {
    final box = Hive.box(_boxName);

    var response = box.get(url);
    return response.toString();
  }

  void cacheApiResponse(String url, String response) async {
    final box = Hive.box(_boxName);

    var newItem = ApiResponseBox(
      url: url,
      response: response,
    );
    box.put(url, newItem);
  }
}
