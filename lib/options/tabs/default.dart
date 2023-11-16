import 'package:flutter/material.dart';

import '../../style/text/tabs-style.dart';
import '../../texts/strings.dart';

class DefaultTabs {
  static List<Tab> tabs = [
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

  DefaultTabs();
}
