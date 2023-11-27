import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';
import 'package:video_player/video_player.dart';

import '../../style/text/text-style.dart';
import '../../widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class InfoCardVedioBody implements InfoCardBody {
  ContentModel item;
  InfoCardVedioBody({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: RatioContainer(
        ratioHeight: 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.content,
              style: TextStyles.infoBodyContentText,
            ),
            const VideoApp(),
          ],
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioWidth: 0.76,
      ratioHeight: 0.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPlaying ? _controller.pause() : _controller.play();
                    isPlaying = !isPlaying;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
