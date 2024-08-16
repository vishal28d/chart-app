// import 'package:charts_flutter_new/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// class VerticalLegend extends StatelessWidget {
//   final List<charts.Series<dynamic, dynamic>> seriesList;

//   const VerticalLegend({Key? key, required this.seriesList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: seriesList.map((series) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Row(
//             children: [
//               Container(
//                 width: 16,
//                 height: 16,
//                 color: series.colorFn!(0, 0).color,
//                 margin: const EdgeInsets.only(right: 8.0),
//               ),
//               Text(
//                 series.id,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
