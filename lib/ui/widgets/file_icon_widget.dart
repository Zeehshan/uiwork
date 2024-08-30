import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/utils.dart';

class FileIconWidget extends StatelessWidget {
  final String extension;
  const FileIconWidget({super.key, required this.extension});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        'assets/icons/${Tools.removeDotFromExtension(extension)}.svg');
  }
}
