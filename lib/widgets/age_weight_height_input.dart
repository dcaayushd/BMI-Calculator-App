import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/bmi_constants.dart';

class AgeWeightHeightInput extends StatefulWidget {
  final int age;
  final int weight;
  final int height;
  final MeasurementSystem? measurementSystem;
  final ValueChanged<int> onAgeChanged;
  final ValueChanged<int> onWeightChanged;
  final ValueChanged<int> onHeightChanged;

  const AgeWeightHeightInput({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
    required this.measurementSystem,
    required this.onAgeChanged,
    required this.onWeightChanged,
    required this.onHeightChanged,
  });

  @override
  _AgeWeightHeightInputState createState() => _AgeWeightHeightInputState();
}

class _AgeWeightHeightInputState extends State<AgeWeightHeightInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AGE',
          style: AppStyles.bodyTextStyle,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  widget.onAgeChanged(
                    (widget.age - 1).clamp(0, 120),
                  );
                },
              ),
              Text(
                '${widget.age}',
                style: AppStyles.valueTextStyle,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.onAgeChanged(
                    (widget.age + 1).clamp(0, 120),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'WEIGHT (${widget.measurementSystem == MeasurementSystem.metric ? 'KG' : 'LBS'})',
          style: AppStyles.bodyTextStyle,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  widget.onWeightChanged(
                    (widget.weight - 1).clamp(0, 500),
                  );
                },
              ),
              Text(
                '${widget.weight}',
                style: AppStyles.valueTextStyle,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.onWeightChanged(
                    (widget.weight + 1).clamp(0, 500),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'HEIGHT (${widget.measurementSystem == MeasurementSystem.metric ? 'CM' : 'FT/IN'})',
          style: AppStyles.bodyTextStyle,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  widget.onHeightChanged(
                    (widget.height - 1).clamp(0, 300),
                  );
                },
              ),
              Text(
                '${widget.height}',
                style: AppStyles.valueTextStyle,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.onHeightChanged(
                    (widget.height + 1).clamp(0, 300),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
