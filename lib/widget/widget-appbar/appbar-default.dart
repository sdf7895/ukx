import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  late Widget? leading;
  late List<Widget>? actions;
  DefaultAppBar({
    super.key,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: leading ?? leading,
      actions: actions ?? actions,
    );
  }
}
