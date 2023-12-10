import 'package:dio/dio.dart';
import 'package:twitter_clone_coding/dataSource/singleton-dio.dart';
import 'package:twitter_clone_coding/model/youtube-video-model.dart';

class YoutubeVideo {
  final Dio _dio = DioSingleton().dio;

  Future<List<YoutubeVideoItem>?> getYoutubeVideo({int? maxResult}) async {
    dynamic success = {
      'part': 'snippet',
      'chart': 'mostPopular',
      'maxResult': 25,
      'key': 'AIzaSyAUJAvH3JbaFBxzREzo5C4c5Awo1hfrRxU',
    };

    try {
      Response response = await _dio.get(
        'videos',
        queryParameters: success,
      );

      if (response.statusCode == 200) {
        YoutubeVideoListResponse youtubeVideoListResponse =
            YoutubeVideoListResponse.fromJson(response.data);

        List<YoutubeVideoItem> items = youtubeVideoListResponse.items;

        return items;
      } else {
        //error class 필요
      }
    } catch (error) {
      //error 처리 필요
    }
    return null;
  }
}
