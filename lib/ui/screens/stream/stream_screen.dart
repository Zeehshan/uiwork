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
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  bottomSheet: state.streamTabType.index == 0
                      ? null
                      : const SingleChildScrollView(child: BottomWidget()),
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
