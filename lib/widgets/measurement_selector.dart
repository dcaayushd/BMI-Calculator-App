import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/bmi_constants.dart';

class MeasurementSelector extends StatefulWidget {
  final ValueChanged<MeasurementSystem> onMeasurementSystemSelected;

  const MeasurementSelector({
    super.key,
    required this.onMeasurementSystemSelected,
  });

  @override
  _MeasurementSelectorState createState() => _MeasurementSelectorState();
}

class _MeasurementSelectorState extends State<MeasurementSelector> {
  MeasurementSystem? selectedSystem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MEASUREMENT SYSTEM',
          style: AppStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSystem = MeasurementSystem.metric;
                    });
                    widget
                        .onMeasurementSystemSelected(MeasurementSystem.metric);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedSystem == MeasurementSystem.metric
                          ? AppColors.accentColor
                          : AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Metric',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSystem = MeasurementSystem.imperial;
                    });
                    widget.onMeasurementSystemSelected(
                        MeasurementSystem.imperial);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedSystem == MeasurementSystem.imperial
                          ? AppColors.accentColor
                          : AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Imperial',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
