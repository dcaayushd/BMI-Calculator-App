// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'themes/app_theme.dart';

// void main() {
//   runApp(const BMICalculatorApp());
// }

// class BMICalculatorApp extends StatelessWidget {
//   const BMICalculatorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BMI Calculator',
//       theme: AppTheme.lightTheme,
//       home: const HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/bmi_form.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatefulWidget {
  @override
  _BMICalculatorAppState createState() => _BMICalculatorAppState();
}

class _BMICalculatorAppState extends State<BMICalculatorApp> {
  ThemeData _themeData = ThemeData.light();

  void _changeTheme(ThemeData theme) {
    setState(() {
      _themeData = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: _themeData,
      home: BMIForm(changeTheme: _changeTheme),
    );
  }
}
