import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeTabProvider(),
      child: Consumer<ChangeTabProvider>(builder: (
        context,
        cart,
        child,
      ) {
        return Scaffold(
          appBar: AppBarWidget(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            title: Text(
              'Header',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backButtonCallback: () {},
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.videocam,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ))
            ],
          ),
          body: const BodyWidget(),
        );
      }),
    );
  }
}
