import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../sheets/users_sheet.dart';
import 'widgets.dart';

class StreamAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const StreamAppBarWidget({
    super.key,
    required this.toolbarHeight,
  });
  final double toolbarHeight;
  @override
  Widget build(BuildContext context) {
    final tabState = Provider.of<ChangeTabProvider>(context);
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            tabState.header,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
          const SubTextWidget()
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      bottom: CustomTabBar(
        myAppBarHeight: toolbarHeight,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.videocam,
              color: Theme.of(context).primaryColor,
              size: 40,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final double myAppBarHeight;
  const CustomTabBar({
    super.key,
    required this.myAppBarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(myAppBarHeight);

  @override
  Widget build(BuildContext context) {
    final tabCProvider = Provider.of<TabCProvider>(context);
    final tabsProvider = Provider.of<ChangeTabProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.person_add),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        tabCProvider.participants.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: TabBar(
                  onTap: (index) => tabsProvider.changeTab(
                    index == 0 ? StreamTabType.first : StreamTabType.second,
                  ),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white, fontSize: 18),
                  padding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  dividerColor: Colors.transparent,
                  isScrollable: false,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.black, fontSize: 18),
                  tabs: List.generate(
                      2,
                      (index) => Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              index == 0 ? 'O' : 'C',
                              textAlign: TextAlign.center,
                            ),
                          )),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () => UserSheet.show(context: context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Users',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
