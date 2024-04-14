import 'package:flutter/material.dart';

class ScreenStreamWidget extends StatelessWidget {
  const ScreenStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle_outlined,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle_outlined,
              )),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
