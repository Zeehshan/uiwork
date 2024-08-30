import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';

class BlurrWidget extends StatefulWidget {
  const BlurrWidget({super.key});

  @override
  _BlurAnimationDemoState createState() => _BlurAnimationDemoState();
}

class _BlurAnimationDemoState extends State<BlurrWidget>
    with SingleTickerProviderStateMixin {
  late ChangeTabProvider changeTabProvider;
  late AnimationController _controller;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    changeTabProvider = context.read<ChangeTabProvider>();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    changeTabProvider.updateAnimationController(_controller);
    _blurAnimation = Tween<double>(begin: 0, end: 80).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateTabPtovider = context.watch<ChangeTabProvider>();
    if (!stateTabPtovider.blurrEnable) return Container();
    return AnimatedBuilder(
      animation: _blurAnimation,
      builder: (context, child) {
        return Positioned.fill(
          child: GestureDetector(
            onTap: () => changeTabProvider.blurrChanged(false),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _blurAnimation.value,
                sigmaY: _blurAnimation.value,
              ),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(
                    0), // Transparent container to apply the blur effect
              ),
            ),
          ),
        );
      },
    );
  }
}
