import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPicker extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;
  final String unit;

  const HeightPicker({super.key, required this.height, required this.onChanged, required this.unit});

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
                    children: List<Widget>.generate(unit == 'cm' ? 251 : 101, (int index) {
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
            Text('Height: ${height.toStringAsFixed(1)} $unit', style: TextStyle(fontSize: 18)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
