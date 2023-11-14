import 'package:flutter/material.dart';

import '../widget-container/ratio-container.dart';

// ignore: must_be_immutable
class CustomListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  Function()? scrollUp;
  Function()? scrollDown;
  Function()? scrollTop;
  CustomListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollUp,
    this.scrollDown,
    this.scrollTop,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  double pixels = 0.0;
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (pixels == 0.0) {
              widget.scrollTop!();
            } else if (pixels < scrollInfo.metrics.pixels && pixels != 0.0) {
              widget.scrollDown!();
            } else if (pixels > scrollInfo.metrics.pixels && pixels != 0.0) {
              widget.scrollUp!();
            }

            if (scrollInfo is ScrollEndNotification) {
              pixels = scrollInfo.metrics.pixels;
            }

            return true;
          },
          child: ListView.builder(
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          )),
    );
  }
}
