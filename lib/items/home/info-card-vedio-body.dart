import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';

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
      padding: const EdgeInsets.only(left: 70),
      child: RatioContainer(
        ratioHeight: 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.content,
              style: TextStyles.infoBodyContentText,
            ),
          ],
        ),
      ),
    );
  }
}
