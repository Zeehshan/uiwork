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
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: state.streamTabType.index,
                    child: Scaffold(
                      appBar: const StreamAppBarWidget(
                        toolbarHeight: 120,
                      ),
                      bottomSheet: state.streamTabType.index == 0
                          ? null
                          : const SingleChildScrollView(child: BottomWidget()),
                      body: const TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // // if (state.streamTabType.index == 0)
                          TabOListWidget(),
                          // // if (state.streamTabType.index == 1)
                          ChatsWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const BlurrWidget(),
              const OptionsWidget(),
            ],
          ),
        );
      }),
    );
  }
}
