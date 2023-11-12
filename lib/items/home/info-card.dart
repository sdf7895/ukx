import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  ContentModel item;
  InfoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoCardHeader(),
        InfoCardBodyFactory.create(item: item).build(context),
        InfoCardBottom(),
      ],
    );
  }
}

class InfoCardHeader extends StatelessWidget {
  const InfoCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.2,
      child: Row(
        children: [],
      ),
    );
  }
}

class InfoCardBottom extends StatelessWidget {
  const InfoCardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.2,
      child: Row(
        children: [],
      ),
    );
  }
}
