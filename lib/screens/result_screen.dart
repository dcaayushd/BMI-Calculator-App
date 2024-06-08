import 'package:bmi_calculator/Components/ract_button.dart';
import 'package:bmi_calculator/Controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  const Text("Back"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "Your BMI is",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: bmiController.colorStatus.value,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 350,
                child: Obx(
                  () => CircularPercentIndicator(
                    animationDuration: 1000,
                    footer: Text(
                      bmiController.bMIstatus.value,
                      style: TextStyle(
                        color: bmiController.colorStatus.value,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    radius: 130,
                    lineWidth: 30,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: bmiController.tempBMI.value / 100,
                    center: Text(
                      "${bmiController.bMI.value}%",
                      style: TextStyle(
                          color: bmiController.colorStatus.value,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    progressColor: bmiController.colorStatus.value,
                    backgroundColor:
                        bmiController.colorStatus.value.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text(
                    "Your BMI is 20.7, indicating your weight is in the Normal category for adults of your height.  For your height, a normal weight range would be from 53.5 to 72 kilograms.Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity."),
              ),
              const SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  Get.back();
                },
                btnName: "Find Out More",
                icon: Icons.arrow_back_ios_new_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
