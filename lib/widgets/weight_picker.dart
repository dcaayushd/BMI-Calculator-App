import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightPicker extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;
  final String unit;

  const WeightPicker({super.key, required this.weight, required this.onChanged, required this.unit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
            height: 200,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  height: 180,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int value) {
                      onChanged(value.toDouble());
                    },
                    children: List<Widget>.generate(201, (int index) {
                      return Center(child: Text('${index} $unit'));
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6.0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Weight: ${weight.toStringAsFixed(1)} $unit', style: TextStyle(fontSize: 18)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
