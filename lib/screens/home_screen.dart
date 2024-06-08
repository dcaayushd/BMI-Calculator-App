import 'package:bmi_calculator/Components/age_selector.dart';
import 'package:bmi_calculator/Components/height_selector.dart';
import 'package:bmi_calculator/Components/primary_button.dart';
import 'package:bmi_calculator/Components/ract_button.dart';
import 'package:bmi_calculator/Components/weight_selector.dart';
import 'package:bmi_calculator/Controllers/bmi_controller.dart';
import 'package:bmi_calculator/Screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/theme_change_btn.dart';
// import '../Config/colors.dart';
// import '../Controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      // backgroundColor:  ? dBgColor : lBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const ThemeChangeBtn(),
              Row(
                children: [
                  Text(
                    "Welcome 😊",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PrimaryButton(
                    onPress: () {
                      bmiController.genderHandle("MALE");
                    },
                    icon: Icons.male,
                    btnName: "MALE",
                  ),
                  const SizedBox(width: 20),
                  PrimaryButton(
                    onPress: () {
                      bmiController.genderHandle("FEMALE");
                    },
                    icon: Icons.female,
                    btnName: "FEMALE",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeightSelector(),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeightSelector(),
                          AgeSelector(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  bmiController.calculateBMI();
                  Get.to(() => const ResultScreen());
                },
                icon: Icons.calculate_rounded,
                btnName: "CALCULATE BMI",
              )
            ],
          ),
        ),
      ),
    );
  }
}
