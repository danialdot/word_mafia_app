import 'package:word_mafia_app/model/local/token_local_data_source.dart';

Future<Map<String, String>> qraphqlHeaders() async {
  String token = await getAccessToken() ?? '';

  Map<String, String> headers;
  if (token == '') {
    headers = {
      "Content-Type": "application/json",
    };
  } else {
    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  return headers;
}

Future<Map<String, String>> restHeaders() async {
  String token = await getAccessToken() ?? '';

  Map<String, String> headers;
  if (token == '') {
    headers = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "X-Requested-With",
    };
  } else {
    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "X-Requested-With",
    };
  }

  return headers;
}
