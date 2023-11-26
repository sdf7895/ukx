import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hashtagable/hashtagable.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/controller/content-options.dart';
import 'package:twitter_clone_coding/style/border/border.dart';
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
          child: Column(
        children: _makeTextField(items: widget.optionsController.textField),
      )),
    );
  }

  /// yet
  List<Widget> _makeTextField({required Map<int, TextFieldModel> items}) {
    Map<int, Widget> list = {};
    for (int key in items.keys) {
      list[key] = CustomTextField(onClick: () {
        widget.optionsController.contentRemove(index: key);
      }, onChange: (data, cursorIndex) {
        widget.optionsController.keyboardEvent(data, cursorIndex);
      });
    }

    return list.values.toList();
  }
}

class CustomTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final Function(String value, int cursorIndex)? onChange;
  final Function()? onClick;
  final Function()? onTap;

  const CustomTextField({
    Key? key,
    this.focusNode,
    this.onClick,
    this.onChange,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: HashTagTextField(
        controller: _controller,
        focusNode: widget.focusNode,
        onChanged: (value) {
          if (widget.onChange != null) {
            int cursorPosition = _controller.selection.base.offset;

            widget.onChange!(value, cursorPosition);
          }
        },
        basicStyle: const TextStyle(color: Colors.white),
        keyboardAppearance: Brightness.dark,
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
              if (widget.onClick != null) {
                widget.onClick!();
              }
            },
          ),
        ),
      ),
    );
  }
}
