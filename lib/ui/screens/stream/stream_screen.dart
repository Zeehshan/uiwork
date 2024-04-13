import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/providers.dart';
import 'widgets/widgets.dart';

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeTabProvider(),
      child: Consumer<ChangeTabProvider>(builder: (
        context,
        state,
        child,
      ) {
        return Scaffold(
          bottomSheet: AnimatedContainer(
            color: Theme.of(context).colorScheme.onBackground,
            height: state.streamTabType.index == 0 ? 0 : 60,
            duration: const Duration(milliseconds: 300),
            child: const ScreenStreamWidget(),
          ),
          body: DefaultTabController(
            length: 2,
            initialIndex: state.streamTabType.index,
            child: CustomScrollView(
              slivers: [
                const StreamAppBarWidget(),
                // if (state.streamTabType.index == 0)
                //   // const SliverToBoxAdapter(
                //   //   child: IconsWidget(),
                //   // ),
                if (state.streamTabType.index == 0) const TabOListWidget(),
                if (state.streamTabType.index == 1) const ChatsWidget(),
              ],
            ),
          ),
        );
        // return Scaffold(
        //   appBar: AppBarWidget(
        //     backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        //     title: Text(
        //       'Header',
        //       style: Theme.of(context)
        //           .textTheme
        //           .titleLarge!
        //           .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //     centerTitle: true,
        //     backButtonCallback: () {},
        //     actions: [
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             CupertinoIcons.videocam,
        //             color: Theme.of(context).primaryColor,
        //             size: 40,
        //           ))
        //     ],
        //   ),
        //   body: const BodyWidget(),
        // );
      }),
    );
  }
}
