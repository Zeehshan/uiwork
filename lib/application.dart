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
        ChangeNotifierProvider(create: (context) => TabOProvider()),
        Provider<TabCProvider>(create: (context) => TabCProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamScreen(),
      ),
    );
  }
}
