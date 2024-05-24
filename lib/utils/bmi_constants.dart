import 'package:flutter/material.dart';

import 'app_colors.dart';

enum Gender { male, female }

enum MeasurementSystem { metric, imperial }

class BMICategory {
  final String name;
  final String description;
  final Color color;

  const BMICategory._({
    required this.name,
    required this.description,
    required this.color,
  });

  static const severelyUnderweight = BMICategory._(
    name: 'Severely Underweight',
    description: 'You are severely underweight. Please consult a doctor.',
    color: AppColors.severelyUnderweightColor,
  );

  static const underweight = BMICategory._(
    name: 'Underweight',
    description: 'You are underweight. You should consider gaining some weight.',
    color: AppColors.underweightColor,
  );

  static const healthy = BMICategory._(
    name: 'Healthy',
    description: 'Congratulations! You have a healthy body weight.',
    color: AppColors.healthyColor,
  );

  static const overweight = BMICategory._(
    name: 'Overweight',
    description: 'You are overweight. You should consider losing some weight.',
    color: AppColors.overweightColor,
  );

  static const obese = BMICategory._(
    name: 'Obese',
    description: 'You are obese. Please consult a doctor and take necessary steps.',
    color: AppColors.obeseColor,
  );
}