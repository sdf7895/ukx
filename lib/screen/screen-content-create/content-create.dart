import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/content-body.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/content-options-box.dart';
import 'package:twitter_clone_coding/screen/screen-content-create/controller/content-options.dart';
import 'package:twitter_clone_coding/texts/strings.dart';
import 'package:twitter_clone_coding/widget/widget-appbar/appbar-default.dart';
import 'package:twitter_clone_coding/widget/widget-bottom-sheet/bottom-sheet.dart';
import 'package:twitter_clone_coding/widget/widget-button/button.dart';
import 'package:twitter_clone_coding/widget/widget-container/main-container.dart';

class ContentCreate extends StatefulWidget {
  const ContentCreate({super.key});

  @override
  State<ContentCreate> createState() => _ContentCreateState();
}

class _ContentCreateState extends State<ContentCreate> {
  TextEditingController text = TextEditingController();
  final ContentOptionsController _controller = ContentOptionsController();

  bool _status = false;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        appbar: DefaultAppBar(
          leading: CustomButton(
            title: AppBarDefaultTabBar.cancel,
            bgColor: Colors.black,
            boderColor: Colors.black,
            onClick: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            CustomButton(
              title: AppBarDefaultTabBar.add,
              onClick: () {
                setState(() {
                  _status = !_status;
                });
              },
            )
          ],
        ),
        child: ListenableBuilder(
          listenable: _controller,
          builder: (contexnt, widget) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContentBodyTextField(optionsController: _controller),
                    ContentOptionsBox(optionsController: _controller),
                  ],
                ),
                BottomSheetWidget(
                  isOpen: _controller.mentionStatus,
                  bottomHeight: 0.3,
                  child: const SizedBox(
                    height: 300,
                    child: Text('hi1231231'),
                  ),
                )
              ],
            );
          },
        ));
  }
}
