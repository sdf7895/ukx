import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavigation extends StatefulWidget {
  final Color bgColor;
  final Color unselectedItemColor;
  final Color selectedItemColor;

  final bool isOpen;

  Function(int index)? onChange;

  CustomBottomNavigation({
    Key? key,
    this.bgColor = Colors.transparent,
    this.unselectedItemColor = Colors.grey,
    this.selectedItemColor = Colors.white,
    this.isOpen = true,
    this.onChange,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: (_heightAnimation.value == 0.0)
          ? kBottomNavigationBarHeight + 100
          : 0.0,
      child: BottomNavigationBar(
        unselectedItemColor: widget.unselectedItemColor,
        selectedItemColor: widget.selectedItemColor,
        backgroundColor: widget.bgColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
            backgroundColor: widget.bgColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
            backgroundColor: widget.bgColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.people,
              size: 30,
            ),
            label: '',
            backgroundColor: widget.bgColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.mail,
              size: 30,
            ),
            label: '',
            backgroundColor: widget.bgColor,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: kBottomNavigationBarHeight + 100,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    if (!widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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
