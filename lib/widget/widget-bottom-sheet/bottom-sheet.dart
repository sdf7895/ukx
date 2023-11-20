import 'package:flutter/material.dart';

import '../widget-container/ratio-container.dart';

// ignore: must_be_immutable
class BottomSheetWidget extends StatefulWidget {
  bool isOpen;
  Color bgColor;
  Widget child;
  double ratioWidth;
  double ratioHeight;

  Function(bool status)? onCurrentStatus;

  BottomSheetWidget({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.isOpen = false,
    this.ratioWidth = 1,
    this.ratioHeight = 1,
    this.onCurrentStatus,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with SingleTickerProviderStateMixin {
  double _offset = 0.0;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: GestureDetector(
            onPanUpdate: (details) {
              bottomDownUpdate(details: details);
            },
            onPanEnd: (details) {
              bottomUpUpdate();
            },
            child: RatioContainer(
              margin: _offset,
              bgColor: widget.bgColor,
              ratioWidth: widget.ratioWidth,
              ratioHeight: widget.ratioHeight,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }

  void bottomDownUpdate({required DragUpdateDetails details}) {
    double y = details.delta.dy;

    setState(
      () {
        y = y / 2;

        if (_offset + y < 0) {
          _offset = 0.0;
        } else if (_offset > MediaQuery.of(context).size.height / 20) {
          if (widget.onCurrentStatus != null) {
            widget.onCurrentStatus!(false);
          }
          _controller.reverse();
        } else {
          _offset += y;
        }
      },
    );
  }

  void bottomUpUpdate() {
    if (_offset < MediaQuery.of(context).size.height / 20) {
      setState(() {
        if (widget.onCurrentStatus != null) {
          widget.onCurrentStatus!(widget.isOpen);
        }
        _offset = 0.0;
      });
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 3.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    if (widget.isOpen) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(BottomSheetWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen) {
      _controller.forward();

      //** 1 을 기준으로 x,y 중 y 값은 아래로 내려갈수록 값이 커짐 그래서 아예 없앨땐 y 값이 커야되고
      // 반대로  y 값이 작을땐 그만큼 위로 올라옴 */
      double correction =
          widget.ratioHeight > 0.5 ? 0 : widget.ratioHeight - 0.2;
      _offsetAnimation = Tween<Offset>(
        begin: const Offset(0.0, 2.0),
        end: Offset(0.0, 1 - widget.ratioHeight + correction),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ),
      );

      setState(() {
        _offset = 0.0;
      });
    } else {
      _controller.reverse();
    }
  }
}
