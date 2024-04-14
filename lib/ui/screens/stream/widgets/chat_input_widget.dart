import 'package:flutter/material.dart';

import 'widgets.dart';

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({super.key});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(_onCommmentChanged);
  }

  _onCommmentChanged() {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const ScreenStreamWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 6,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.shade300),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: Theme.of(context).dividerColor)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Text Message',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13,
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 30,
                height: 30,
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                decoration: const BoxDecoration(
                  color: Color(0xff115CCD),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(100),
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
