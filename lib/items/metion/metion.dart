import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/items/metion/metion-item.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

class MetionBox extends StatefulWidget {
  const MetionBox({super.key});

  @override
  State<MetionBox> createState() => _MetionBoxState();
}

class _MetionBoxState extends State<MetionBox> {
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.5,
      child: Column(
        children: [
          MetionItem(
            item: MetionModel(
                userThumbnail: 'https://source.unsplash.com/random/300×300',
                id: 'skdfxk12',
                name: '@안녕'),
          ),
          MetionItem(
            item: MetionModel(
                userThumbnail: 'https://source.unsplash.com/random/300×300',
                id: 'skdfxk12',
                name: '@안녕'),
          ),
          MetionItem(
            item: MetionModel(
                userThumbnail: 'https://source.unsplash.com/random/300×300',
                id: 'skdfxk12',
                name: '@안녕'),
          )
        ],
      ),
    );
  }
}
