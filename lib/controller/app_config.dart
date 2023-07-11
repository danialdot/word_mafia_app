import 'package:word_mafia_app/model/remote/config/check_server/check_server_data_source.dart';
import 'package:get/get.dart';

class AppConfigController extends GetxController {
  Future<bool> checkIfServerIsReachable() async {
    try {
      bool response = await checkIfServerIsReachableRemoteDataSource();
      return response;
    } catch (e) {
      return false;
    }
  }
}
