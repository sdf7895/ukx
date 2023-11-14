import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/controller/list-view-controller.dart';
import 'package:twitter_clone_coding/items/home/info-card.dart';
import 'package:twitter_clone_coding/options/actions/setting.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';
import 'package:twitter_clone_coding/style/text/tabs-style.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar.dart';
import 'package:twitter_clone_coding/widget/widget-bottomNavi/bottom-navigation.dart';
import 'package:twitter_clone_coding/widget/widget-container/main-container.dart';
import 'package:twitter_clone_coding/widget/widget-listView/list.dart';

import '../../options/actions/profile.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  List<ContentModel> homeData = HomeContent().homeContent;
  final ListViewController _listViewController = ListViewController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListenableBuilder(
        listenable: _listViewController,
        builder: (context, child) {
          return MainContainer(
            appbar: CustomAppBar(
              isOpen: _listViewController.scrollState,
              tabs: tabs,
              title: 'X',
              actions: const [
                ProfileAction(),
                SettingAction(),
              ],
            ),
            // ignore: sort_child_properties_last
            child: TabBarView(
              children: [
                CustomListView(
                  scrollTop: () {
                    _listViewController.changeState(true);
                  },
                  scrollUp: () {
                    _listViewController.changeState(true);
                  },
                  scrollDown: () {
                    _listViewController.changeState(false);
                  },
                  itemCount: homeData.length,
                  itemBuilder: (BuildContext context, index) {
                    return InfoCard(
                      item: ContentModel(
                          user_id: homeData[index].user_id,
                          userThumbnail: homeData[index].userThumbnail,
                          content: homeData[index].content,
                          contentType: homeData[index].contentType),
                    );
                  },
                ),
                Container()
              ],
            ),
            bottomNavigationBar: CustomBottomNavigation(
              isOpen: _listViewController.scrollState,
            ),
          );
        },
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
