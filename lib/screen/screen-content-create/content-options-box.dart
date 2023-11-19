import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/controller/content-options.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class ContentOptionsBox extends StatelessWidget {
  late ContentOptionsController optionsController;
  ContentOptionsBox({
    super.key,
    required this.optionsController,
  });

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.1,
      child: Row(
        children: [
          VoiceAdd(),
          PhotoAdd(),
          TagAdd(),
          GifAdd(),
          ContentAdd(controller: optionsController),
        ],
      ),
    );
  }
}

class VoiceAdd extends StatelessWidget {
  const VoiceAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.voice_chat,
        color: Colors.blue,
      ),
    );
  }
}

class PhotoAdd extends StatelessWidget {
  const PhotoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.add_a_photo,
        color: Colors.blue,
      ),
    );
  }
}

class TagAdd extends StatelessWidget {
  const TagAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.tag_faces,
        color: Colors.blue,
      ),
    );
  }
}

class GifAdd extends StatelessWidget {
  const GifAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.gif,
        color: Colors.blue,
      ),
    );
  }
}

// ignore: must_be_immutable
class ContentAdd extends StatelessWidget {
  late ContentOptionsController controller;
  ContentAdd({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.contentAdd();
      },
      icon: const Icon(
        Icons.add,
        color: Colors.blue,
      ),
    );
  }
}
