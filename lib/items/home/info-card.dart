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
      ratioHeight: 0.05,
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

class InfoCardBottomModel {
  dynamic icon;
  String count;
  InfoCardBottomModel({required this.icon, required this.count});
}

// ignore: must_be_immutable
class InfoCardBottom extends StatelessWidget {
  ContentModel item;
  InfoCardBottom({
    super.key,
    required this.item,
  });

  final List<InfoCardBottomModel> _iconData = [
    InfoCardBottomModel(icon: Icons.remove_red_eye, count: '12.0k'),
    InfoCardBottomModel(icon: Icons.heart_broken, count: '7.3k'),
    InfoCardBottomModel(icon: Icons.monitor_heart, count: '2.1k'),
    InfoCardBottomModel(icon: Icons.auto_graph_rounded, count: '1.2k'),
  ];

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioWidth: 0.8,
      ratioHeight: 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _makeOptions(),
      ),
    );
  }

  List<Widget> _makeOptions() {
    return _iconData
        .map(
          (e) => Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  e.icon,
                  color: Colors.white,
                ),
              ),
              Text(
                e.count,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
        .toList();
  }
}
