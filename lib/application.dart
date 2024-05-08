import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'ui/screens/screens.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TabOProvider>(create: (context) => TabOProvider()),
        Provider<ChangeTabProvider>(create: (context) => ChangeTabProvider()),
      ],
      child: const MaterialApp(
        home: StreamScreen(),
      ),
    );
  }
}
