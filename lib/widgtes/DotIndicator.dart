import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 8 : 4,
      width: 20,
      decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFff385c)
              : const Color(0xFFff385c).withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      duration: const Duration(microseconds: 300),
    );
  }
}
