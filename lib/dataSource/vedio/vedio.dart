import 'package:dio/dio.dart';
import 'package:twitter_clone_coding/dataSource/singleton-dio.dart';

class YoutubeVedio {
  final Dio _dio = DioSingleton().dio;

  Future<void> getYoutubeVedios({int? maxResult}) async {
    try {
      Response response = await _dio.get(
        'videos',
        queryParameters: {
          'part': 'snippet',
          'chart': 'mostPopular',
          'maxResult': 10,
          'key': 'AIzaSyAUJAvH3JbaFBxzREzo5C4c5Awo1hfrRxU',
        },
      );

      print(response.data);
    } catch (error) {}
  }
}
