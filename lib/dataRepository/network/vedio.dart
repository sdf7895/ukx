import 'package:twitter_clone_coding/dataSource/video/video.dart';
import 'package:twitter_clone_coding/model/youtube-video-model.dart';

class YoutubuVideoRepository {
  final YoutubeVideo _youtubeVideo = YoutubeVideo();
  Future<List<YoutubeVideoItem>?> getYoutubeVideos({int? maxResult}) {
    return _youtubeVideo.getYoutubeVideo(maxResult: maxResult);
  }
}
