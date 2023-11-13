import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/factory/home-info-body-factory.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';

// ignore: must_be_immutable
class InfoCardVedioBody implements InfoCardBody {
  ContentModel item;
  InfoCardVedioBody({
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
