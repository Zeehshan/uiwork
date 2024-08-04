import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UploadProgressWidget extends StatelessWidget {
  final double percentage;
  const UploadProgressWidget({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: LinearPercentIndicator(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          barRadius: const Radius.circular(100),
          lineHeight: 4,
          padding: EdgeInsets.zero,
          percent: (percentage / 100).toDouble(),
          progressColor: Theme.of(context).primaryColor),
    );
  }
}
