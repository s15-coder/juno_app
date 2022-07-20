import 'package:flutter/material.dart';

import 'package:juno_app/widgets/custom_card.dart';
import 'package:juno_app/widgets/statistics_chart.dart';
import 'package:juno_app/theme/custom_color_scheme.dart';

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
                children: [
                  Text(
                    'TRM',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.oppositeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'USD > COP',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.oppositeColor),
                  ),
                ],
              ),
            ),
            const StatisticsChart()
          ],
        ));
  }
}
