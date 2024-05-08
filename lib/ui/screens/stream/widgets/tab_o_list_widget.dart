import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';

class TabOListWidget extends StatelessWidget {
  const TabOListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final metaState = Provider.of<TabOProvider>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = metaState.metas[index];
        if (item.metatype?.toLowerCase() == 'f') {
          return ListTile(
            leading: const Icon(Icons.file_copy),
            title: Text.rich(TextSpan(text: item.metatext, children: [
              const TextSpan(
                text: ', ',
              ),
              TextSpan(
                text: Tools.formatBytes(item.metasize),
              ),
            ])),
            subtitle: Text.rich(TextSpan(text: item.participant, children: [
              const TextSpan(
                text: ', ',
              ),
              TextSpan(
                text: Tools.utcDateTimeFormat(item.metatime!),
              ),
            ])),
          );
        }
        return Container();
      }, childCount: metaState.metas.length),
    );
  }
}
