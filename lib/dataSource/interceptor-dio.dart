import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.baseUrl}');
    options.validateStatus = (statusCode) {
      if (statusCode == 400 || statusCode == 200) {
        return true;
      }
      return false;
    };
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    super.onError(err, handler);
  }
}
