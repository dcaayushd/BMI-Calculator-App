import 'package:flutter/material.dart';

import '../models/bmi_calculation.dart';
// import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/bmi_constants.dart';
import '../utils/helpers.dart';
import '../widgets/age_weight_height_input.dart';
import '../widgets/bmi_card.dart';
import '../widgets/gender_selector.dart';
import '../widgets/measurement_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  MeasurementSystem? measurementSystem;
  int age = 25;
  int weight = 60;
  int height = 170;

  BMICalculation? bmiCalculation;

  void updateBMI() {
    final heightInMeters = measurementSystem == MeasurementSystem.metric
        ? (height / 100.0)
        : heightInCmFromFeetInches(height) / 100.0;

    final weightInKg = measurementSystem == MeasurementSystem.metric
        ? weight.toDouble()
        : weightInKgFromPounds(weight);

    if (selectedGender != null) {
      final bmi = BMICalculation(
        age: age,
        gender: selectedGender!,
        heightInMeters: heightInMeters,
        weightInKg: weightInKg,
      );

      setState(() {
        bmiCalculation = bmi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    BMICard(
                      child: GenderSelector(
                        onGenderSelected: (gender) {
                          setState(() {
                            selectedGender = gender;
                            updateBMI();
                          });
                        },
                      ),
                    ),
                    BMICard(
                      child: MeasurementSelector(
                        onMeasurementSystemSelected: (system) {
                          setState(() {
                            measurementSystem = system;
                            updateBMI();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BMICard(
                child: AgeWeightHeightInput(
                  age: age,
                  weight: weight,
                  height: height,
                  measurementSystem: measurementSystem,
                  onAgeChanged: (value) {
                    setState(() {
                      age = value;
                      updateBMI();
                    });
                  },
                  onWeightChanged: (value) {
                    setState(() {
                      weight = value;
                      updateBMI();
                    });
                  },
                  onHeightChanged: (value) {
                    setState(() {
                      height = value;
                      updateBMI();
                    });
                  },
                ),
              ),
              if (bmiCalculation != null)
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      color: bmiCalculation!.bmiCategory.color,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Your BMI'.toUpperCase(),
                                style: AppStyles.headingTextStyle,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                bmiCalculation!.bmi.toStringAsFixed(1),
                                style: AppStyles.valueTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                bmiCalculation!.bmiCategory.description,
                                style: AppStyles.bodyTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
