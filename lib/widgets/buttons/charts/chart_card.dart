import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({Key? key, required this.color, required this.title}) : super(key: key);
  final String title;
  final Color color;

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
      width: width * 0.315,
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
          Row(
            children: [
              SizedBox(
                height: 130,
                width: width * 0.25,
                child: LineChart(
                  LineChartData(
                    minX: 1,
                    maxX: 12,
                    minY: 300,
                    maxY: 1000,
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
                            case 6:
                              return 'Jun';
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
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 200:
                              return '200';
                            case 400:
                              return '400';
                            case 600:
                              return '600';
                            case 800:
                              return '800';
                            case 1000:
                              return '1000';
                            default:
                              return '';
                          }
                        },
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
                        spots: [
                          FlSpot(1, 400),
                          FlSpot(2, 500),
                          FlSpot(3, 800),
                          FlSpot(4, 850),
                          FlSpot(5, 750),
                          FlSpot(6, 700),
                          FlSpot(7, 750),
                          FlSpot(8, 720),
                          FlSpot(9, 750),
                          FlSpot(10, 800),
                          FlSpot(11, 820),
                          FlSpot(12, 810),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
