import 'package:dio/dio.dart';

import '../constent/api_url.dart';
import '../model/city.dart';
import 'dio_helper.dart';

class GetCityList {
  Future<List<City>> callAPI() async {
    DioHelper dioHelper = DioHelper();

    String apiToken = "";
    List<City> cityList = [];

    Response? responseToken = await dioHelper.callAPI(ApiURL.getTokenAPI, {});
    if (responseToken != null && responseToken.data["status"] == 200) {
      apiToken = responseToken.data["data"] as String;
    }
    Response? responseCity = await dioHelper.callAPI(ApiURL.getCityListAPI, {
      'token': apiToken,
    });
    if (responseCity != null && responseCity.data["status"] == 200) {
      final cityMap = responseCity.data["data"] as List;
      cityList = cityMap.map((e) => City.fromJson(e)).toList();
    }
    return cityList;
  }
}
