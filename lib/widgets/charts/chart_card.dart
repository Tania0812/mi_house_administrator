import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mi_house_administrator/features/stats/models/stats_by_month_model.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({Key? key, required this.color, required this.title, required this.statsByMonth})
      : super(key: key);
  final String title;
  final Color color;
  final StatsByMonthResponse statsByMonth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final width = isLarge ? size.width - 270 : size.width - 170;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey[300]!, spreadRadius: 1)],
      ),
      height: 200,
      width: width * 0.49,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              const Icon(Icons.menu, color: Colors.grey),
            ],
          ),
          SizedBox(
            height: 130,
            width: width * 0.49,
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 12,
                minY: 0,
                maxY: statsByMonth.data.getMaxValue().toDouble(),
                borderData: FlBorderData(show: false),
                backgroundColor: color.withOpacity(0.15),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (_) => const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return 'Ene';
                        case 2:
                          return 'Feb';
                        case 3:
                          return 'Mar';
                        case 4:
                          return 'Abr';
                        case 5:
                          return 'May';
                        case 6:
                          return 'Jul';
                        case 7:
                          return 'Jun';
                        case 8:
                          return 'Ago';
                        case 9:
                          return 'Sep';
                        case 10:
                          return 'Oct';
                        case 11:
                          return 'Nov';
                        case 12:
                          return 'Dec';
                        default:
                          return '';
                      }
                    },
                    margin: 4,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (_) => const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    margin: 6,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    colors: [color],
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [color.withOpacity(0.5)],
                    ),
                    dotData: FlDotData(show: false),
                    spots: statsByMonth.data
                        .getByMonthNumber()
                        .map((e) => FlSpot(e.numberMonth.toDouble(), e.users.toDouble()))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
