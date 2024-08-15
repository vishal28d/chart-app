import 'package:chart_app/model/agricultureData.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

class AgriculturalChartWidget extends StatelessWidget {
  final List<AgriculturalData> data;

  const AgriculturalChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Use context to get theme data
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black;

    // Assuming the `data` parameter already contains filtered data for a specific university.
    // If you need to filter, you could do so here:
    // final filteredData = data.where((item) => item.university == selectedUniversity).toList();

    // Convert filtered data to chart series
    List<charts.Series<AgriculturalData, String>> series = [
      charts.Series(
        id: 'Expenditure',
        data: data,
        domainFn: (AgriculturalData chartData, _) => chartData.university,
        measureFn: (AgriculturalData chartData, _) => chartData.totalExpenditure,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (AgriculturalData chartData, _) => chartData.totalExpenditure.toString(),
      )
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Expenditure of Agricultural Universities',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
              domainAxis: const charts.OrdinalAxisSpec(),
              behaviors: [
                charts.ChartTitle('Universities',
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                charts.ChartTitle('Total Expenditure',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
