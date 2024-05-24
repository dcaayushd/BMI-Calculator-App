import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final Color color;

  const ResultCard({
    super.key,
    required this.title,
    required this.value,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title.toUpperCase(),
            style: AppStyles.headingTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: AppStyles.valueTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppStyles.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}