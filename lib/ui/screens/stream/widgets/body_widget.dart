import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/utils.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  StreamTabType streamTabType = StreamTabType.first;

  _changeTab(StreamTabType tabType) => setState(() {
        streamTabType = tabType;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Text(
                'Subtext',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      color: streamTabType == StreamTabType.second
                          ? null
                          : Colors.transparent,
                    ),
              ),
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
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            2,
                            (index) => Expanded(
                                  child: AnimatedContainer(
                                    margin: const EdgeInsets.only(right: 8),
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      color: streamTabType ==
                                              (index == 0
                                                  ? StreamTabType.first
                                                  : StreamTabType.second)
                                          ? Theme.of(context).primaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () => _changeTab(
                                        index == 0
                                            ? StreamTabType.first
                                            : StreamTabType.second,
                                      ),
                                      child: Text(
                                        index == 0 ? 'O' : 'C',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 22,
                                              color: streamTabType ==
                                                      (index == 0
                                                          ? StreamTabType.first
                                                          : StreamTabType
                                                              .second)
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
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
