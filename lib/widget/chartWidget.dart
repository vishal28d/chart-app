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

    // Create multiple series for different types of expenditures
    List<charts.Series<AgriculturalData, String>> series = [
      charts.Series(
        id: 'State',
        data: data,
        domainFn: (AgriculturalData chartData, _) => chartData.university,
        measureFn: (AgriculturalData chartData, _) => chartData.stateExpenditure,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (AgriculturalData chartData, _) =>
            chartData.stateExpenditure.toString(),
      ),
      charts.Series(
        id: 'ICAR',
        data: data,
        domainFn: (AgriculturalData chartData, _) => chartData.university,
        measureFn: (AgriculturalData chartData, _) => chartData.icarExpenditure,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        labelAccessorFn: (AgriculturalData chartData, _) =>
            chartData.icarExpenditure.toString(),
      ),
      charts.Series(
        id: 'Other Sources',
        data: data,
        domainFn: (AgriculturalData chartData, _) => chartData.university,
        measureFn: (AgriculturalData chartData, _) =>
            chartData.otherSourcesExpenditure,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        labelAccessorFn: (AgriculturalData chartData, _) =>
            chartData.otherSourcesExpenditure.toString(),
      ),
      charts.Series(
        id: 'Total',
        data: data,
        domainFn: (AgriculturalData chartData, _) => chartData.university,
        measureFn: (AgriculturalData chartData, _) => chartData.totalExpenditure,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        labelAccessorFn: (AgriculturalData chartData, _) =>
            chartData.totalExpenditure.toString(),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Expenditure of Agricultural Universities',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
      
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              barGroupingType: charts.BarGroupingType.grouped, // Group the bars by category
              barRendererDecorator: charts.BarLabelDecorator<String> (),
              domainAxis: const charts.OrdinalAxisSpec(),
              behaviors: [
                charts.ChartTitle('Universities',
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                charts.ChartTitle('Expenditure (in Thousands)',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                charts.SeriesLegend(outsideJustification: charts.OutsideJustification.start), // Add a legend to differentiate the series
              ],
            ),
          ),
        ],
      ),
    );
  }
}
