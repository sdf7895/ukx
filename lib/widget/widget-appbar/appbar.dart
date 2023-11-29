import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Widget> actions;
  final Color bgColor;
  final Color textColor;
  final List<Tab>? tabs;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.tabs,
  });

  @override
  _CustomAppBarWithoutAnimationState createState() =>
      _CustomAppBarWithoutAnimationState();

  @override
  Size get preferredSize {
    return Size.fromHeight(
        kToolbarHeight + (tabs != null ? kTextTabBarHeight : 0));
  }
}

class _CustomAppBarWithoutAnimationState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.bgColor,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.actions[0],
          Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
          widget.actions[1],
        ],
      ),
      bottom: widget.tabs != null
          ? TabBar(
              tabs: widget.tabs!,
              labelColor: Colors.white,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              dividerColor: Colors.black,
            )
          : null,
    );
  }
}
