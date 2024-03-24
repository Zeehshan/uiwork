import 'package:flutter/material.dart';
import 'widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              const SubTextWidget(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '3 Participants',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                    const TabsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}
