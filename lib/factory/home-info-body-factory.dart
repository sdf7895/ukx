import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/items/home/info-card-gif-body.dart';
import 'package:twitter_clone_coding/items/home/info-card-image-body.dart';
import 'package:twitter_clone_coding/items/home/info-card-text-body.dart';

import '../static/home-contents.dart';

abstract class InfoCardBody {
  Widget build(BuildContext context);
}

abstract class InfoCardBodyFactory {
  static InfoCardBody create({required ContentModel item}) {
    switch (item.contentType) {
      case 'image':
        return InfoCardImageBody(item: item);
      case 'gif':
        return InfoCardGifBody(item: item);
      case 'text':
        return InfoCardTextBody(item: item);
      default:
        return throw ArgumentError(
            'Unsupported shape type: ${item.contentType}');
    }
  }
}
