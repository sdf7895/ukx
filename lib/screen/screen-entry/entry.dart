import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/options/actions/setting.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar.dart';
import 'package:twitter_clone_coding/widget/widget-bottomNavi/bottom-navigation.dart';
import 'package:twitter_clone_coding/widget/widget-container/main-container.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appbar: CustomAppBar(
        title: 'X',
        actions: [],
      ),
      child: Container(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
