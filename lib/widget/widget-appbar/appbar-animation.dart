import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar.dart';

class AnimatedCustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget baseAppBar;
  final bool isOpen;

  AnimatedCustomAppBar({
    Key? key,
    required String title,
    required List<Widget> actions,
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.bold,
    List<Tab>? tabs,
    this.isOpen = true,
  })  : baseAppBar = CustomAppBar(
          key: key,
          title: title,
          actions: actions,
          bgColor: bgColor,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          tabs: tabs,
        ),
        super(key: key);

  @override
  _AnimatedCustomAppBarState createState() => _AnimatedCustomAppBarState();

  @override
  Size get preferredSize {
    return baseAppBar.preferredSize;
  }
}

class _AnimatedCustomAppBarState extends State<AnimatedCustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _heightAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: SizedBox(
            height: _heightAnimation.value,
            child: widget.baseAppBar,
          ),
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

    _heightAnimation = Tween<double>(
      begin: 50.0,
      end: 250.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

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
  void didUpdateWidget(AnimatedCustomAppBar oldWidget) {
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
