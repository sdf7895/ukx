import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/style/text/text-style.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

class MetionModel {
  final String userThumbnail;
  final String id;
  final String name;

  MetionModel({
    required this.userThumbnail,
    required this.id,
    required this.name,
  });
}

// ignore: must_be_immutable
class MetionItem extends StatelessWidget {
  late MetionModel item;
  MetionItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.1,
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.id,
                  style: TextStyles.infoBodyContentText,
                ),
                Text(
                  item.name,
                  style: TextStyles.infoBodyContentText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
