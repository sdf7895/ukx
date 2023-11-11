import 'package:flutter/material.dart';

import '../widget-container/ratio-container.dart';

class CustomListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  CustomListView({
      super.key,
      required this.itemCount,
      required this.itemBuilder,
    });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.itemCount,
                itemBuilder: widget.itemBuilder),
          )
  }
}
