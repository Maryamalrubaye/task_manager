import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class DataServices extends GetConnect implements GetxService {
  Future<Response> getData(String responsePath) async {
    if (kDebugMode) {
      print(Constants.MAIN_URL + responsePath);
    }
    Response response = await get(Constants.MAIN_URL + responsePath,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }

  Future<Response> postData(String responsePath, dynamic body) async {
    Response response = await post(Constants.MAIN_URL + responsePath, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }

  Future<Response> putData(String responsePath, dynamic body) async {
    Response response = await put(Constants.MAIN_URL + responsePath, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }

  Future<Response> deleteData(String responsePath) async {
    Response response = await delete(Constants.MAIN_URL + responsePath,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }
}
