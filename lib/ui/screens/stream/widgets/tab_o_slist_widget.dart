import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryan/providers/providers.dart';

class TabOListWidget extends StatelessWidget {
  const TabOListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabState = Provider.of<ChangeTabProvider>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
                leading: Icon(tabState.tabOList[index]),
              ),
          childCount: tabState.tabOList.length),
    );
  }
}
