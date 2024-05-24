// import '../models/bmi_data.dart';

// class BMICalculator {
//   static double calculateBMI(BMIdata data) {
//     double heightInMeters;
//     if (data.isMetric) {
//       heightInMeters = data.height! / 100;
//     } else {
//       heightInMeters = data.height! * 0.0254;
//     }

//     double weightInKg = data.isMetric ? data.weight! : data.weight! * 0.453592;
//     return weightInKg / (heightInMeters * heightInMeters);
//   }

//   static String getBMICategory(double bmi) {
//     if (bmi < 18.5) {
//       return 'Underweight';
//     } else if (bmi >= 18.5 && bmi < 24.9) {
//       return 'Normal weight';
//     } else if (bmi >= 25 && bmi < 29.9) {
//       return 'Overweight';
//     } else {
//       return 'Obesity';
//     }
//   }

//   static String getBMIDescription(double bmi) {
//     if (bmi < 18.5) {
//       return 'You are underweight. It is recommended to eat a balanced diet and consult with a healthcare provider.';
//     } else if (bmi >= 18.5 && bmi < 24.9) {
//       return 'You have a normal body weight. Keep up the good work!';
//     } else if (bmi >= 25 && bmi < 29.9) {
//       return 'You are overweight. Consider a healthy diet and regular exercise.';
//     } else {
//       return 'You are obese. It is advisable to consult with a healthcare provider for proper guidance.';
//     }
//   }
// }


import '../models/bmi_data.dart';

class BMICalculator {
  static double calculateBMI(BMIdata data) {
    double heightInMeters = data.isMetric ? data.height! / 100 : data.height! * 0.0254;
    double weightInKg = data.isMetric ? data.weight! : data.weight! * 0.453592;
    return weightInKg / (heightInMeters * heightInMeters);
  }

  static String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  static String getBMIDescription(double bmi) {
    if (bmi < 18.5) {
      return 'You are underweight. It is recommended to eat a balanced diet and consult a healthcare provider.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'You are overweight. Consider a healthy diet and exercise regularly.';
    } else {
      return 'You are obese. It is recommended to consult a healthcare provider for advice.';
    }
  }
}
