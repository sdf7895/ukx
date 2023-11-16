import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainContainer extends StatefulWidget {
  PreferredSizeWidget? appbar;
  Widget child;
  Widget? bottomNavigationBar;
  FloatingActionButton? floatingActionButton;
  double ratioWidth;
  double ratioHeight;

  MainContainer({
    super.key,
    this.appbar,
    required this.child,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.ratioWidth = 1.0,
    this.ratioHeight = 1.0,
  });

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      body: Container(
        width: MediaQuery.sizeOf(context).width * widget.ratioWidth,
        height: MediaQuery.sizeOf(context).height * widget.ratioHeight,
        child: widget.child,
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
