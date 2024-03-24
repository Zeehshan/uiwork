import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';

class SubTextWidget extends StatelessWidget {
  const SubTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabState = Provider.of<ChangeTabProvider>(context);
    return Text(
      'Subtext',
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 14,
            color: tabState.streamTabType == StreamTabType.second
                ? null
                : Colors.transparent,
          ),
    );
  }
}
