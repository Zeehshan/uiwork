import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';

class SendButtonWidget extends StatelessWidget {
  final Function() onTap;
  const SendButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tabC = context.watch<TabCProvider>();
    bool show = false;
    if (tabC.files.isNotEmpty || tabC.message.isNotEmpty) {
      show = true;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: show ? 34 : 0,
      height: show ? 34 : 0,
      margin: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).primaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: context.read<TabCProvider>().currentUser == null
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ChatMessagesProvider>().messageSent(
                        message: context.read<TabCProvider>().message,
                        currentUser: context.read<TabCProvider>().currentUser!,
                      );
                  onTap();
                },
          borderRadius: BorderRadius.circular(100),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
