import 'package:dio/dio.dart';
import 'package:twitter_clone_coding/dataSource/interceptor-dio.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();
  late Dio _dio;

  factory DioSingleton({String? url}) {
    return _singleton;
  }

  DioSingleton._internal() {
    _dio = Dio();
    _dio.options.baseUrl = "https://www.googleapis.com/youtube/v3/";
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 5);

    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;
}
