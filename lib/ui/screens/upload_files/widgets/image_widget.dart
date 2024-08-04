import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  const ImageWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 10,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.file(
          File(path),
          height: 100,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
