import 'package:flutter/material.dart';

class MyRactButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String btnName;
  const MyRactButton(
      {super.key,
      required this.onPress,
      required this.btnName,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primaryContainer),
            const SizedBox(width: 10),
            Text(
              btnName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Theme.of(context).colorScheme.primaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}
