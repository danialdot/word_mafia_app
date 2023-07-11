import 'package:hive/hive.dart';

part 'hive_api_response.g.dart';

@HiveType(typeId: 0) //declare unique for every class
class ApiResponseBox extends HiveObject {
  @HiveField(0) //unique index of the field
  String url;

  @HiveField(1)
  String response;

  ApiResponseBox({
    required this.url,
    required this.response,
  });

  @override
  String toString() {
    return response.toString();
  }
}
