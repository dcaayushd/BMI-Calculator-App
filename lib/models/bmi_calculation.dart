// import '../utils/app_colors.dart';
import '../utils/bmi_constants.dart';

class BMICalculation {
  final int age;
  final Gender gender;
  final double heightInMeters;
  final double weightInKg;

  double get bmi => weightInKg / (heightInMeters * heightInMeters);

  BMICategory get bmiCategory {
    if (gender == Gender.male) {
      if (age <= 18) {
        if (bmi < 16.0) {
          return BMICategory.severelyUnderweight;
        } else if (bmi < 18.5) {
          return BMICategory.underweight;
        } else if (bmi < 25.0) {
          return BMICategory.healthy;
        } else if (bmi < 30.0) {
          return BMICategory.overweight;
        } else {
          return BMICategory.obese;
        }
      } else {
        if (bmi < 18.5) {
          return BMICategory.underweight;
        } else if (bmi < 25.0) {
          return BMICategory.healthy;
        } else if (bmi < 30.0) {
          return BMICategory.overweight;
        } else {
          return BMICategory.obese;
        }
      }
    } else {
      if (age <= 18) {
        if (bmi < 16.0) {
          return BMICategory.severelyUnderweight;
        } else if (bmi < 18.5) {
          return BMICategory.underweight;
        } else
        if (bmi < 24.0) {
          return BMICategory.healthy;
        } else if (bmi < 30.0) {
          return BMICategory.overweight;
        } else {
          return BMICategory.obese;
        }
      } else {
        if (bmi < 18.5) {
          return BMICategory.underweight;
        } else if (bmi < 24.0) {
          return BMICategory.healthy;
        } else if (bmi < 30.0) {
          return BMICategory.overweight;
        } else {
          return BMICategory.obese;
        }
      }
    }
  }

  BMICalculation({
    required this.age,
    required this.gender,
    required this.heightInMeters,
    required this.weightInKg,
  });
}