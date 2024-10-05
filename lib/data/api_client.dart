import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; 
import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mapApiUrl);
    dio = Dio(baseOptions);
  }
  Future<Response> getDataRequest({required String path}) async {
    try {
      debugPrint("🚀=====GET API REQUEST=====🚀");
      var response = await dio.get(path);
      debugPrint("🔥=====Path=====🔥");
       debugPrint("${ApiConstant.mapApiUrl}$path");
      debugPrint("🔥=====GET API RESPONSE=====🔥");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.message!);
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> postDataRequest(
      {required String path, required Map<String, dynamic>? body}) async {
        final Options options = Options(headers: {});
    try {
      debugPrint("🚀=====POST API REQUEST=====🚀");
      debugPrint("🚀=====POST API URL ${baseOptions.baseUrl}$path=====🚀");
      var response =
          await dio.post(path, data: body, options: options);
      debugPrint("🔥=====POST API RESPONSE=====🔥");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.message!);
        throw ApiException(message: e.message);
      }
    }
  }
}
