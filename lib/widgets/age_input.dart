import 'package:flutter/material.dart';

class AgeInput extends StatelessWidget {
  final Function(String) onSaved;

  const AgeInput({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      onSaved: (value) {
        onSaved(value!);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter age';
        }
        return null;
      },
    );
  }
}
