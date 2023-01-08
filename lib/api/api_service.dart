import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/api/urls.dart';
import 'package:news_app/utils/utils.dart';

import '../data/model/failure.dart';
import 'app_exception.dart';

class ApiService {
  final Dio _dio = Dio();

  Future getRequest({required String path}) async {
    dynamic responseJson;
    try {
      String url = '$baseUrl$path';
      final response = await _dio.get(url);
      customPrinter(
          'URL => $url\nStatusCode => ${response.statusCode}\nHeaders => ${response.headers}\nResponse Data => ${response.data}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw Failure(message: 'No Internet Connection');
    } on DioError catch (err) {
      throw Failure(message: err.message);
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
