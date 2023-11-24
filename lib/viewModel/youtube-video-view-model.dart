import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/dataRepository/network/vedio.dart';
import 'package:twitter_clone_coding/model/youtube-video-model.dart';

class YoutubeVideoViewModel extends ChangeNotifier {
  late final YoutubuVideoRepository _youtubeRepository;

  List<YoutubeVideoItem>? _videos;
  List<YoutubeVideoItem>? get videos => _videos;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  YoutubeVideoViewModel() {
    _youtubeRepository = YoutubuVideoRepository();
    getYoutubeVideos();
  }

  void getYoutubeVideos({int? maxResult}) async {
    _videos = await _youtubeRepository.getYoutubeVideos(maxResult: maxResult);

    _loadingStatus(false);
  }

  void _loadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }
}
