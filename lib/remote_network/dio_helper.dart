import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: kBASEURL,
          headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json'
          },
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token,
      required Map<String, dynamic> data}) async {
    print(dio.options.baseUrl);
    // this totally wrong because we assign new option without base url
    //dio.options = BaseOptions(headers: {'lang': lang, 'authorization': token});
    dio.options.headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
      'Authorization':
          'Bearer $token'
    });

    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token,
      required Map<String, dynamic> data}) async {
    print(dio.options.baseUrl);
    // this totally wrong because we assign new option without base url
    //dio.options = BaseOptions(headers: {'lang': lang, 'authorization': token});
    dio.options.headers.addAll({'lang': lang, 'authorization': token});

    return await dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? queries,
      String token = ''}) async {
    // DioHelper.init();
    dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    // here we wait until get method get data
    return await dio.get(
      url,
      queryParameters: queries,
    );
  }
}
