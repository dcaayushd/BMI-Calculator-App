import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BMICard extends StatelessWidget {
  final Widget child;

  const BMICard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }
}