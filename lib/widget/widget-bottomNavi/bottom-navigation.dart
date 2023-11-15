import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/style/icon/bottom-navigation.dart';

import '../../texts/strings.dart';

// ignore: must_be_immutable
class CustomBottomNavigation extends StatefulWidget {
  final Color bgColor;
  final Color unselectedItemColor;
  final Color selectedItemColor;

  final bool isOpen;

  Function(int index)? onChange;
  // ignore: use_key_in_widget_constructors
  CustomBottomNavigation({
    Key? key,
    this.bgColor = Colors.black,
    this.unselectedItemColor = Colors.grey,
    this.selectedItemColor = Colors.white,
    this.isOpen = true,
    this.onChange,
  });

  @override
  State<CustomBottomNavigation> createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _heightAnimation;

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: SizedBox(
            height: _heightAnimation.value,
            child: BottomNavigationBar(
              unselectedItemColor: widget.unselectedItemColor,
              selectedItemColor: widget.selectedItemColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: BottomNavigationIcon.home,
                  label: BottomNavigation.home,
                  backgroundColor: widget.bgColor,
                ),
                BottomNavigationBarItem(
                  icon: BottomNavigationIcon.search,
                  label: BottomNavigation.aTour,
                  backgroundColor: widget.bgColor,
                ),
                BottomNavigationBarItem(
                  icon: BottomNavigationIcon.people,
                  label: BottomNavigation.storageBox,
                  backgroundColor: widget.bgColor,
                ),
                BottomNavigationBarItem(
                  icon: BottomNavigationIcon.mail,
                  label: BottomNavigation.storageBox,
                  backgroundColor: widget.bgColor,
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
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
      begin: 0.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.5),
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
  void didUpdateWidget(CustomBottomNavigation oldWidget) {
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

  void _onItemTapped(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
