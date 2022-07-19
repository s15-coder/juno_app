import 'package:flutter/material.dart';

import 'package:juno_app/widgets/custom_card.dart';
import 'package:juno_app/widgets/statistics_chart.dart';

class StatisticsContainer extends StatefulWidget {
  const StatisticsContainer({Key? key}) : super(key: key);

  @override
  State<StatisticsContainer> createState() => _StatisticsContainerState();
}

class _StatisticsContainerState extends State<StatisticsContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomCard(
        height: size.height * .4,
        width: size.width * 0.8,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'TRM',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'USD > COP',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const StatisticsChart()
          ],
        ));
  }
}
