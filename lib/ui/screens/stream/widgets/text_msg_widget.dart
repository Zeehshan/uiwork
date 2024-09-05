import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../../utils/utils.dart';

class TextMessageWidget extends StatelessWidget {
  final BubbleType type;
  final MessageModel message;
  const TextMessageWidget(
      {super.key, required this.type, required this.message});

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color bg;
    double lp, rp;

    if (type == BubbleType.sendBubble) {
      textColor = Colors.white;
      bg = Theme.of(context).primaryColor;
      rp = 14 + 14;
      lp = 14;
    } else {
      textColor = Theme.of(context).textTheme.headlineMedium!.color!;
      bg = Colors.grey.shade300;
      lp = 14 + 14;
      rp = 14 + 14;
    }
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: lp, right: rp, top: 7, bottom: 11),
      child: Text(
        message.content,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: textColor, fontSize: 14),
      ),
    );
  }
}
