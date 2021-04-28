import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartPie extends StatelessWidget {
  const ChartPie({Key? key, required this.title}) : super(key: key);
  final String title;
  //final int touchedIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final width = isLarge ? size.width - 270 : size.width - 170;
    return Container(
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
              const Icon(Icons.arrow_drop_down_circle, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 130,
                width: width * 0.25,
                // child: PieChart(
                //   PieChartData(
                //       pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                //         setState(() {
                //           final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                //               pieTouchResponse.touchInput is! PointerUpEvent;
                //           if (desiredTouch && pieTouchResponse.touchedSection != null) {
                //             touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                //           } else {
                //             touchedIndex = -1;
                //           }
                //         });
                //         // TODO: terminar
                //       }),
                //       borderData: FlBorderData(
                //         show: false,
                //       ),
                //       sectionsSpace: 0,
                //       centerSpaceRadius: 0,
                //       sections: showingSections()),
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
