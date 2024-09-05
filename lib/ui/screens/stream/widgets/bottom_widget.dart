import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import 'widgets.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      padding: const EdgeInsets.only(top: 0, bottom: 33),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            const ScreenStreamWidget(),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  // onTap: () => Provider.of<TabCProvider>(context, listen: false)
                  //     .getMediaFiles(),
                  onTap: () =>
                      context.read<ChangeTabProvider>().blurrChanged(true),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2)),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 172,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          GallaryPhotosWidget(),
                          MsgInputWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
