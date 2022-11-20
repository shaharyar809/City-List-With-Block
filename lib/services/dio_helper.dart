import 'package:dio/dio.dart';

class DioHelper {
  final BaseOptions _defaultConfigs = BaseOptions(
    baseUrl: 'https://fluttertest.q3logics.com/api',
  );

  Future<Response?> callAPI(
      String apiURL, Map<String, dynamic> queryParameters) async {
    final Response response;
    Dio dio = Dio(_defaultConfigs);
    try {
      response = await dio.get(apiURL, queryParameters: queryParameters);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
