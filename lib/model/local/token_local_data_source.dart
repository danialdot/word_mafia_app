import 'package:word_mafia_app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveAccessToken(String accessToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(LocalKey.accessToken, accessToken);
}

Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(LocalKey.accessToken);
  return accessToken;
}

void saveRefreshToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(LocalKey.refreshToken, token);
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString(LocalKey.refreshToken);
  return token;
}

void clearCash() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(LocalKey.accessToken);
  await prefs.remove(LocalKey.refreshToken);
}
