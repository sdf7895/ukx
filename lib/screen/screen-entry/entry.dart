import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/options/actions/setting.dart';
import 'package:twitter_clone_coding/style/text/tabs-style.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar.dart';
import 'package:twitter_clone_coding/widget/widget-bottomNavi/bottom-navigation.dart';
import 'package:twitter_clone_coding/widget/widget-container/main-container.dart';

import '../../options/actions/profile.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainContainer(
        appbar: CustomAppBar(
          title: 'X',
          actions: const [
            ProfileAction(),
            SettingAction(),
          ],
          tabs: tabs,
        ),
        child: TabBarView(children: [Container(), Container()]),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }

  List<Tab> tabs = [
    Tab(
      child: Text(
        AppBarDefaultTabBar.defatulOne,
        style: TabStyles.defaultTab,
      ),
    ),
    Tab(
      child: Text(
        AppBarDefaultTabBar.defaultTwo,
        style: TabStyles.defaultTab,
      ),
    )
  ];
}
