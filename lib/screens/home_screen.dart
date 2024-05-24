import 'package:flutter/material.dart';
import 'bmi_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body:   Padding(
        padding: EdgeInsets.all(16.0),
        child: BMIForm(changeTheme: (ThemeData ) {  },),
      ),
    );
  }
}
