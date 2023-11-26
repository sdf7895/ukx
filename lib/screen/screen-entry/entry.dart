import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/controller/list-view-controller.dart';
import 'package:twitter_clone_coding/items/home/info-card-vedio-body.dart';
import 'package:twitter_clone_coding/options/actions/setting.dart';
import 'package:twitter_clone_coding/options/tabs/default.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/content-create.dart';
import 'package:twitter_clone_coding/static/home-contents.dart';
import 'package:twitter_clone_coding/style/text/tabs-style.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/viewModel/youtube-video-view-model.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar-animation.dart';
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
  final YoutubeVideoViewModel _youtubeVideoViewModel = YoutubeVideoViewModel();
  final ListViewController _listViewController = ListViewController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListenableBuilder(
        listenable: _listViewController,
        builder: (context, child) {
          return MainContainer(
            appbar: AnimatedCustomAppBar(
              isOpen: _listViewController.scrollState,
              tabs: DefaultTabs.tabs,
              title: 'X',
              actions: const [
                ProfileAction(),
                SettingAction(),
              ],
            ),
            // ignore: sort_child_properties_last
            child: ListenableBuilder(
              listenable: _youtubeVideoViewModel,
              builder: (BuildContext content, Widget? widget) {
                return _youtubeVideoViewModel.isLoading
                    ? const SizedBox(
                        width: 1.0, // 너비 설정
                        height: 1.0, // 높이 설정
                        child: CircularProgressIndicator(),
                      )
                    : TabBarView(
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
                            itemCount: _youtubeVideoViewModel.videos!.length,
                            itemBuilder: (BuildContext context, index) {
                              return const VideoApp();
                            },
                          ),
                          Container()
                        ],
                      );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContentCreate(),
                  ),
                );
              },
              child: const Icon(Icons.add),
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
