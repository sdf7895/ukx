import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/controller/content-options.dart';
import 'package:twitter_clone_coding/style/border/border.dart';
import 'package:twitter_clone_coding/style/text/text-style.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class ContentBodyTextField extends StatefulWidget {
  late ContentOptionsController optionsController;
  ContentBodyTextField({
    super.key,
    required this.optionsController,
  });

  @override
  State<ContentBodyTextField> createState() => _ContentBodyTextFieldState();
}

class _ContentBodyTextFieldState extends State<ContentBodyTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.3,
      child: SingleChildScrollView(
          child: ListenableBuilder(
        listenable: widget.optionsController,
        builder: (context, child) {
          return Column(
            children: _makeTextField(items: widget.optionsController.textField),
          );
        },
      )),
    );
  }

  List<Widget> _makeTextField({required Map<int, TextFieldModel> items}) {
    Map<int, Widget> list = {};
    for (int key in items.keys) {
      list[key] = CustomTextField(
        onClick: () {
          widget.optionsController.contentRemove(index: key);
        },
      );
    }

    return list.values.toList();
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  late FocusNode? focusNode;
  late Function()? onClick;
  CustomTextField({
    super.key,
    this.focusNode,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode ?? focusNode,
      style: TextStyles.contentTextField,
      decoration: InputDecoration(
          hintText: TextFieldHint.content,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(10.0),
            width: 30.0,
            height: 30.0,
            decoration: TotalBorders.borderCircle,
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              if (onClick != null) {
                onClick!();
              }
            },
          )),
    );
  }
}
