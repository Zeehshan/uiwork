import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabState = Provider.of<ChangeTabProvider>(context);
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            2,
            (index) => Expanded(
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(right: 8),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: tabState.streamTabType ==
                              (index == 0
                                  ? StreamTabType.first
                                  : StreamTabType.second)
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => tabState.changeTab(
                        index == 0 ? StreamTabType.first : StreamTabType.second,
                      ),
                      child: Text(
                        index == 0 ? 'O' : 'C',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 22,
                              color: tabState.streamTabType ==
                                      (index == 0
                                          ? StreamTabType.first
                                          : StreamTabType.second)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
