// import 'package:flutter/material.dart';
// import '../models/bmi_data.dart';
// import '../widgets/gender_selector.dart';
// import '../widgets/unit_toggle.dart';
// import '../widgets/age_picker.dart';
// import '../widgets/result_display.dart';
// import '../widgets/weight_picker.dart';
// import '../widgets/height_picker.dart';
// import '../utils/bmi_calculator.dart';

// class BMIForm extends StatefulWidget {
//   const BMIForm({super.key, required void Function(ThemeData theme) changeTheme});

//   @override
//   BMIFormState createState() => BMIFormState();
// }

// class BMIFormState extends State<BMIForm> {
//   // final _formKey = GlobalKey<FormState>();
//   final BMIdata _bmiData = BMIdata();
//   String _bmiResult = '';
//   String _bmiCategory = '';
//   String _bmiDescription = '';

//   void _calculateBMI() {
//     double bmi = BMICalculator.calculateBMI(_bmiData);
//     setState(() {
//       _bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
//       _bmiCategory = BMICalculator.getBMICategory(bmi);
//       _bmiDescription = BMICalculator.getBMIDescription(bmi);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         GenderSelector(
//           onChanged: (gender) {
//             setState(() {
//               _bmiData.gender = gender;
//             });
//           },
//         ),
//         const SizedBox(height: 20),
//         UnitToggle(
//           isMetric: _bmiData.isMetric,
//           onToggle: (isMetric) {
//             setState(() {
//               _bmiData.isMetric = isMetric;
//             });
//           },
//         ),
//         const SizedBox(height: 20),
//         if (_bmiData.isMetric) ...[
//           WeightPicker(
//             weight: _bmiData.weight ?? 60,
//             onChanged: (value) {
//               setState(() {
//                 _bmiData.weight = value;
//               });
//             },
//             unit: 'kg',
//           ),
//           const SizedBox(height: 20),
//           HeightPicker(
//             height: _bmiData.height ?? 170,
//             onChanged: (value) {
//               setState(() {
//                 _bmiData.height = value;
//               });
//             },
//             unit: 'cm',
//           ),
//         ] else ...[
//           WeightPicker(
//             weight: _bmiData.weight ?? 132,
//             onChanged: (value) {
//               setState(() {
//                 _bmiData.weight = value;
//               });
//             },
//             unit: 'lbs',
//           ),
//           const SizedBox(height: 20),
//           HeightPicker(
//             height: _bmiData.height ?? 67,
//             onChanged: (value) {
//               setState(() {
//                 _bmiData.height = value;
//               });
//             },
//             unit: 'in',
//           ),
//         ],
//         const SizedBox(height: 20),
//         AgePicker(
//           age: _bmiData.age ?? 25,
//           onChanged: (value) {
//             setState(() {
//               _bmiData.age = value;
//             });
//           },
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: _calculateBMI,
//           child: const Text('Calculate'),
//         ),
//         const SizedBox(height: 20),
//         ResultDisplay(result: _bmiResult, category: _bmiCategory, description: _bmiDescription),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../models/bmi_data.dart';
import '../widgets/age_picker.dart';
import '../widgets/gender_selector.dart';
import '../widgets/height_picker.dart';
import '../widgets/result_display.dart';
import '../widgets/unit_toggle.dart';
import '../widgets/weight_picker.dart';
import '../utils/bmi_calculator.dart';

class BMIForm extends StatefulWidget {
  final Function(ThemeData) changeTheme;

  BMIForm({required this.changeTheme});

  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  // final _formKey = GlobalKey<FormState>();
  BMIdata _bmiData = BMIdata();
  String _bmiResult = '';
  String _bmiCategory = '';
  String _bmiDescription = '';

  void _calculateBMI() {
    double bmi = BMICalculator.calculateBMI(_bmiData);
    setState(() {
      _bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
      _bmiCategory = BMICalculator.getBMICategory(bmi);
      _bmiDescription = BMICalculator.getBMIDescription(bmi);
    });
    _updateThemeBasedOnBMI(bmi);
  }

  void _updateThemeBasedOnBMI(double bmi) {
    ThemeData theme;
    if (bmi < 18.5) {
      theme = ThemeData.light().copyWith(primaryColor: Colors.blueAccent);
    } else if (bmi >= 18.5 && bmi < 24.9) {
      theme = ThemeData.light().copyWith(primaryColor: Colors.green);
    } else if (bmi >= 25 && bmi < 29.9) {
      theme = ThemeData.light().copyWith(primaryColor: Colors.orange);
    } else {
      theme = ThemeData.light().copyWith(primaryColor: Colors.redAccent);
    }
    widget.changeTheme(theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GenderSelector(
              onChanged: (gender) {
                setState(() {
                  _bmiData.gender = gender;
                });
              },
            ),
            SizedBox(height: 20),
            UnitToggle(
              isMetric: _bmiData.isMetric,
              onToggle: (isMetric) {
                setState(() {
                  _bmiData.isMetric = isMetric;
                });
              },
            ),
            SizedBox(height: 20),
            if (_bmiData.isMetric) ...[
              WeightPicker(
                weight: _bmiData.weight ?? 60,
                onChanged: (value) {
                  setState(() {
                    _bmiData.weight = value;
                  });
                },
                unit: 'kg',
              ),
              SizedBox(height: 20),
              HeightPicker(
                height: _bmiData.height ?? 170,
                onChanged: (value) {
                  setState(() {
                    _bmiData.height = value;
                  });
                },
                unit: 'cm',
              ),
            ] else ...[
              WeightPicker(
                weight: _bmiData.weight ?? 132,
                onChanged: (value) {
                  setState(() {
                    _bmiData.weight = value;
                  });
                },
                unit: 'lbs',
              ),
              SizedBox(height: 20),
              HeightPicker(
                height: _bmiData.height ?? 67,
                onChanged: (value) {
                  setState(() {
                    _bmiData.height = value;
                  });
                },
                unit: 'in',
              ),
            ],
            SizedBox(height: 20),
            AgePicker(
              age: _bmiData.age ?? 25,
              onChanged: (value) {
                setState(() {
                  _bmiData.age = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            ResultDisplay(result: _bmiResult, category: _bmiCategory, description: _bmiDescription),
          ],
        ),
      ),
    );
  }
}
