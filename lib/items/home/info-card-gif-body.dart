import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';

// ignore: must_be_immutable
class InfoCardGifBody implements InfoCardBody {
  ContentModel item;
  InfoCardGifBody({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      item.contentType,
      style: TextStyle(color: Colors.white),
    );
  }
}
