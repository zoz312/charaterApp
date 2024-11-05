import 'package:braekingbad/constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

class Characterswebservice {
  late Dio dio;

  Characterswebservice() {
    BaseOptions options = BaseOptions(
        baseUrl: basrurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10));
    dio = Dio(options);
}
    Future<dynamic> getAllCharacters() async {
      try {
        final response = await dio.get('character');
        return response.data['results'];
      } on Exception catch (e) {
        print(e.toString());
      }
    }
  
}
