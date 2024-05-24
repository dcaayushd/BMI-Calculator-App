import 'package:flutter/material.dart';

class UnitToggle extends StatefulWidget {
  final bool isMetric;
  final Function(bool) onToggle;

  const UnitToggle({super.key, required this.isMetric, required this.onToggle});

  @override
  UnitToggleState createState() => UnitToggleState();
}

class UnitToggleState extends State<UnitToggle> {
  bool? _isMetric;

  @override
  void initState() {
    super.initState();
    _isMetric = widget.isMetric;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Metric'),
        Switch(
          value: _isMetric!,
          onChanged: (value) {
            setState(() {
              _isMetric = value;
            });
            widget.onToggle(value);
          },
        ),
        const Text('Imperial'),
      ],
    );
  }
}
