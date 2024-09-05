import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import 'widgets.dart';

class MsgInputWidget extends StatefulWidget {
  const MsgInputWidget({super.key});

  @override
  State<MsgInputWidget> createState() => _MsgInputWidgetState();
}

class _MsgInputWidgetState extends State<MsgInputWidget> {
  late TextEditingController controller;
  late TabCProvider tabCProvider;
  @override
  void initState() {
    super.initState();
    tabCProvider = Provider.of<TabCProvider>(context, listen: false);
    controller = TextEditingController();
    controller.addListener(_onCommmentChanged);
  }

  _onCommmentChanged() => tabCProvider.changedMessage(controller.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            scrollPadding: EdgeInsets.zero,
            maxLines: null,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Start typing..',
              contentPadding:
                  const EdgeInsets.only(bottom: 0, left: 11, right: 11),
              alignLabelWithHint: true,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ),
        SendButtonWidget(
          onTap: () {
            controller.clear();
          },
        ),
      ],
    );
  }
}
