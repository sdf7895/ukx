import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Widget> actions;
  final Color bgColor;
  final Color textColor;
  final List<Tab>? tabs;

  final bool isOpen;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.tabs,
    this.isOpen = true,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(
        kToolbarHeight + (tabs != null ? kTextTabBarHeight : 0));
  }
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: widget.isOpen
              ? AppBar(
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
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 70),
                        )
                      : null,
                )
              : null,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(CustomAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
