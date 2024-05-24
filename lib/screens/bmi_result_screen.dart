import 'package:flutter/material.dart';

import '../models/bmi_calculation.dart';
import '../utils/app_colors.dart';
// import '../utils/app_styles.dart';
import '../utils/bmi_constants.dart';
import '../widgets/result_card.dart';

class BMIResultScreen extends StatelessWidget {
  final BMICalculation bmiCalculation;

  const BMIResultScreen({
    super.key,
    required this.bmiCalculation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ResultCard(
                title: 'Your BMI',
                value: bmiCalculation.bmi.toStringAsFixed(1),
                description: bmiCalculation.bmiCategory.description,
                color: bmiCalculation.bmiCategory.color,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ResultCard(
                title: 'Age',
                value: bmiCalculation.age.toString(),
                description: 'Your age',
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ResultCard(
                title: 'Gender',
                value: bmiCalculation.gender == Gender.male ? 'Male' : 'Female',
                description: 'Your gender',
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ResultCard(
                title: 'Height',
                value: '${(bmiCalculation.heightInMeters * 100).toStringAsFixed(0)} cm',
                description: 'Your height',
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ResultCard(
                title: 'Weight',
                value: '${bmiCalculation.weightInKg.toStringAsFixed(0)} kg',
                description: 'Your weight',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}