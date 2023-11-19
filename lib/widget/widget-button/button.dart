import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/style/border/border.dart';
import 'package:twitter_clone_coding/style/text/text-style.dart';

class CustomButton extends StatelessWidget {
  late final String title;
  late final Color bgColor;
  late final Color boderColor;
  final Function()? onClick;

  CustomButton({
    Key? key,
    this.onClick,
    this.bgColor = Colors.blue,
    this.boderColor = Colors.blue,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: TotalBorders.primaryRadius,
        border: Border.all(
          color: boderColor,
        ),
      ),
      child: Center(
        child: InkWell(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyles.defaultAppBarText,
            ),
          ),
        ),
      ),
    );
  }
}
