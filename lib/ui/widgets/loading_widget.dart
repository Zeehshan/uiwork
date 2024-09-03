import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  final Color? loadingColor;

  const LoadingWidget({super.key, this.size = 36.0, this.loadingColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: loadingColor ?? Theme.of(context).primaryColor,
              )
            : CircularProgressIndicator(
                strokeWidth: 2.0,
                color: loadingColor ?? Theme.of(context).primaryColor,
              ),
      ),
    );
  }
}
