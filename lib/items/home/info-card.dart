import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

import '../../style/text/text-style.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  ContentModel item;
  InfoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoCardHeader(item: item),
        InfoCardBodyFactory.create(item: item).build(context),
        InfoCardBottom(item: item),
      ],
    );
  }
}

// ignore: must_be_immutable
class InfoCardHeader extends StatelessWidget {
  late ContentModel item;
  InfoCardHeader({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.1,
      padding: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              item.userThumbnail,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(item.user_id, style: TextStyles.infoCardHeaderStyle),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InfoCardBottom extends StatelessWidget {
  ContentModel item;
  InfoCardBottom({
    super.key,
    required this.item,
  });

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
