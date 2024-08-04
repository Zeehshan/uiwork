import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/models.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';

class TabOListWidget extends StatelessWidget {
  const TabOListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taOProvider = context.watch<TabOProvider>();
    final metas = taOProvider.metas;
    Widget? leading(String? type) {
      switch (type) {
        case 'f':
          return const Icon(Icons.file_copy);
        case 'p':
          return const Icon(CupertinoIcons.photo);
        case 'v':
          return const Icon(CupertinoIcons.play);
        case 'd':
          return const Icon(CupertinoIcons.calendar);
        case 'vm':
          return const Icon(CupertinoIcons.mail);
        case 'g':
          return const Icon(Icons.list);
        default:
          return null;
      }
    }

    Widget titleVal(
      String type, {
      required MetaModel item,
    }) {
      switch (type) {
        case 'f':
          return Text.rich(TextSpan(text: item.metatext, children: [
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.formatBytes(item.metasize),
            ),
          ]));
        case 'p':
        case 'v':
          return Text.rich(TextSpan(text: item.metatext, children: [
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.formatBytes(item.metalength),
            ),
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.formatBytes(item.dtime),
            ),
          ]));
        case 'd':
          return Text(Tools.utcDateTimeFormat(item.dtime!));
        case 'vm':
          return Text.rich(TextSpan(text: 'Voice Mail', children: [
            const TextSpan(
              text: ', Second ',
            ),
            TextSpan(
              text: item.metalength,
            ),
          ]));
        case 'g':
          return Text(item.gtype ?? '');
        default:
          return Container();
      }
    }

    Widget subTitleVal(
      String type, {
      required MetaModel item,
    }) {
      switch (type) {
        case 'f':
          return Text.rich(TextSpan(text: item.participant, children: [
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.dateTimeFormat(item.metatime),
            ),
          ]));
        case 'p':
        case 'v':
          return Text.rich(TextSpan(text: item.participant, children: [
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.formatBytes(item.metatime),
            ),
          ]));
        case 'd':
          return Text(item.participant ?? '');
        case 'vm':
          return Text.rich(TextSpan(text: item.participant, children: [
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: Tools.dateTimeFormat(item.metatime),
            ),
          ]));
        case 'g':
          return Text(
            Tools.dateTimeFormat(item.metatime),
          );
        default:
          return Container();
      }
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = metas[index];
        if (leading(item.metatype?.toString().toLowerCase()) == null) {
          return Container();
        }
        return ListTile(
          leading: leading(item.metatype?.toString().toLowerCase() ?? ''),
          title: titleVal(item.metatype?.toString().toLowerCase() ?? '',
              item: item),
          subtitle: subTitleVal(item.metatype?.toString().toLowerCase() ?? '',
              item: item),
        );
      }, childCount: metas.length),
    );
  }
}
