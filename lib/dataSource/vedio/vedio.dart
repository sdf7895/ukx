import 'package:dio/dio.dart';
import 'package:twitter_clone_coding/dataSource/singleton-dio.dart';

class YoutubeVedio {
  final Dio _dio = DioSingleton().dio;

  Future<void> getYoutubeVedios({int? maxResult}) async {
    try {
      Response response = await _dio.get(
        'vedio',
        queryParameters: {
          'part': 'snippet',
          'chart': 'mostPopular',
          'type': 'vedio',
          'maxResult': 25,
          'key': 'AIzaSyAUJAvH3JbaFBxzREzo5C4c5Awo1hfrRxU',
        },
      );
    } catch (error) {}
  }
}
