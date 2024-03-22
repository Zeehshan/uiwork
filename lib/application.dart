import 'package:flutter/material.dart';

import 'ui/screens/screens.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StreamScreen(),
    );
  }
}
