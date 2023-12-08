import 'package:dio/dio.dart';
import 'package:ecommerce/Core/utils/constants.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? data}) {
    return dio.get(Constants.BASE_URL + endPoint, queryParameters: data);
  }

  Future<Response> postData(
  {required String endPoint, Map<String, dynamic>? body, String? Token}) {
    return dio.post(Constants.BASE_URL + endPoint,
        data: body, options: Options(headers: {"token": Token}));
  }
}
