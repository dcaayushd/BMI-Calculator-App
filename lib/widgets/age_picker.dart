import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgePicker extends StatelessWidget {
  final int age;
  final ValueChanged<int> onChanged;

  const AgePicker({super.key, required this.age, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
            height: 200,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  height: 180,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int value) {
                      onChanged(value);
                    },
                    children: List<Widget>.generate(100, (int index) {
                      return Center(child: Text('${index} years'));
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 6.0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Age: $age years', style: const TextStyle(fontSize: 18)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
