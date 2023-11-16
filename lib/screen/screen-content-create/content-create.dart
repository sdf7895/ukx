import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/style/text/text-style.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar-default.dart';
import 'package:twitter_clone_coding/widget/widget-button/button.dart';
import 'package:twitter_clone_coding/widget/widget-container/main-container.dart';

class ContentCreate extends StatefulWidget {
  ContentCreate({super.key});

  @override
  State<ContentCreate> createState() => _ContentCreateState();
}

class _ContentCreateState extends State<ContentCreate> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appbar: DefaultAppBar(
        leading: CustomButton(
          title: '취소',
          bgColor: Colors.black,
          boderColor: Colors.black,
          onClick: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CustomButton(
            title: '게시하기',
            onClick: () {},
          )
        ],
      ),
      child: Container(),
    );
  }
}
