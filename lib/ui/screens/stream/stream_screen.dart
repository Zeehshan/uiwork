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
        return ChangeNotifierProvider.value(
            value: TabCProvider(),
            builder: (context, child) {
              return Scaffold(
                bottomSheet: AnimatedContainer(
                  height: state.streamTabType.index == 0 ? 0 : 120,
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: const SingleChildScrollView(child: ChatInputWidget()),
                ),
                body: DefaultTabController(
                  length: 2,
                  initialIndex: state.streamTabType.index,
                  child: CustomScrollView(
                    slivers: [
                      const StreamAppBarWidget(),
                      if (state.streamTabType.index == 0)
                        const TabOListWidget(),
                      if (state.streamTabType.index == 1) const ChatsWidget(),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
