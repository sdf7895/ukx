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
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo is ScrollUpdateNotification) {
              if (scrollInfo.scrollDelta! < 0) {
                if (widget.scrollUp != null) {
                  widget.scrollUp!();
                }
              } else if (scrollInfo.scrollDelta! > 0) {
                if (widget.scrollDown != null) {
                  widget.scrollDown!();
                }
              }
            }
            if (scrollInfo is ScrollEndNotification) {
              ScrollMetrics metrics = scrollInfo.metrics;
              if (metrics.pixels == metrics.minScrollExtent) {
                print('top');
                // 맨 위에 도달했을 때의 로직
                if (widget.scrollTop != null) {
                  widget.scrollTop!();
                }
              }
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
