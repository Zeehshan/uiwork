import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({super.key});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  late TextEditingController controller;
  late TabCProvider tabCState;
  @override
  void initState() {
    super.initState();
    tabCState = Provider.of<TabCProvider>(context, listen: false);
    controller = TextEditingController();
    controller.addListener(_onCommmentChanged);
  }

  _onCommmentChanged() => tabCState.changedMessage(controller.text);

  @override
  Widget build(BuildContext context) {
    final messageData = context.watch<TabCProvider>().message;
    return Material(
      color: Colors.transparent,
      child: Selector<ChatMessagesProvider, bool>(
          selector: (context, state) =>
              state.lastMessage == messageData ? true : false,
          builder: (context, state, child) {
            if (state) {
              logger.i(state);
              controller.clear();
            }
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade300),
                      child: IconButton(
                        onPressed: () =>
                            CreateDialog.show(context).then((value) {
                          if (value != null) {
                            tabCState.setTitleAndDescription(
                                value[0], value[1]);
                          }
                        }),
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Theme.of(context).dividerColor)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextField(
                                controller: controller,
                                scrollPadding: EdgeInsets.zero,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Text Message',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 13,
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
