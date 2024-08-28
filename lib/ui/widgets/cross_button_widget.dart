import 'package:flutter/material.dart';

class CrossButtonWidget extends StatelessWidget {
  final Function() onTap;
  const CrossButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffE3EAEA),
          ),
          child: const Icon(
            Icons.clear,
            color: Colors.black,
            size: 14,
          ),
        ),
      ),
    );
  }
}
