import 'package:word_mafia_app/core/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> checkIfServerIsReachableRemoteDataSource() async {
  Duration timeout = const Duration(seconds: 5);
  try {
    final client = http.Client();
    final request = http.Request('GET', Uri.parse(AppUrl.checkIfServerIsReachable));
    final response = await client.send(request).timeout(timeout);
    final statusCode = response.statusCode;
    client.close();
    return statusCode == 200;
  } catch (e) {
    return false;
  }
}
