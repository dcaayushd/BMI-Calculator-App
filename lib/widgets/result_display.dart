// import 'package:flutter/material.dart';

// class ResultDisplay extends StatelessWidget {
//   final String result;
//   final String category;
//   final String description;

//   const ResultDisplay({super.key, required this.result, required this.category, required this.description});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           result,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           category,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           description,
//           style: const TextStyle(fontSize: 16),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String result;
  final String category;
  final String description;

  const ResultDisplay({super.key, required this.result, required this.category, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            result,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
