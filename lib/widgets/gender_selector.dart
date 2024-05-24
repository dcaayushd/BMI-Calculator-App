import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final void Function(String) onChanged;

  const GenderSelector({super.key, required this.onChanged});

  @override
  GenderSelectorState createState() => GenderSelectorState();
}

class GenderSelectorState extends State<GenderSelector> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ChoiceChip(
          label: const Text('Male'),
          selected: _selectedGender == 'male',
          onSelected: (selected) {
            setState(() {
              _selectedGender = 'male';
            });
            widget.onChanged('male');
          },
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          label: const Text('Female'),
          selected: _selectedGender == 'female',
          onSelected: (selected) {
            setState(() {
              _selectedGender = 'female';
            });
            widget.onChanged('female');
          },
        ),
      ],
    );
  }
}
