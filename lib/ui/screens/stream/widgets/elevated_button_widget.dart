import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Widget child;
  final bool showProgressIndicator, showGradient;
  final double? height, width, borderWidth;
  final double borderRadius;
  final Function()? onPressed;
  final EdgeInsetsGeometry? margin, padding;
  final Color? backgroundColor, borderSide;
  final double loadingSize;
  const ElevatedButtonWidget(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.borderWidth = 0.0,
      this.borderRadius = 6.0,
      this.showProgressIndicator = false,
      this.showGradient = false,
      required this.onPressed,
      this.backgroundColor,
      this.borderSide = Colors.transparent,
      this.margin,
      this.padding,
      this.loadingSize = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,
      margin: margin,
      decoration: BoxDecoration(
          color: onPressed == null ? null : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: AbsorbPointer(
        absorbing: showProgressIndicator,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: borderWidth!, color: borderSide!),
                  borderRadius: BorderRadius.circular(borderRadius))),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: child,
              )),
        ),
      ),
    );
  }
}
