import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/config/config.dart';
import 'package:juno_app/models/exchange_rate.dart';
import 'package:juno_app/models/result.dart';
import 'package:juno_app/widgets/tooltip_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsChart extends StatefulWidget {
  const StatisticsChart({Key? key}) : super(key: key);

  @override
  State<StatisticsChart> createState() => _StatisticsChartState();
}

class _StatisticsChartState extends State<StatisticsChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true, builder: toolTipBuilder);
  }

  @override
  Widget build(BuildContext context) {
    final exchangeRateProvider = BlocProvider.of<ExchangeRateBloc>(context);
    final size = MediaQuery.of(context).size;

    final List<Color> color = <Color>[];

    color.add(greenJuno);
    color.add(greenJuno.withOpacity(0.7));
    color.add(greenJuno.withOpacity(0));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.7);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color,
        stops: stops,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    return BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
        buildWhen: (previous, current) {
      if (previous.selectedResult != current.selectedResult) {
        return false;
      }

      return true;
    }, builder: (context, state) {
      if (state.fetchingNewData) {
        return Container(
            height: size.height * 0.3,
            alignment: Alignment.center,
            child: const CircularProgressIndicator());
      }

      final exchangeRate = state.getCurrentExchangeRate();

      return SfCartesianChart(
          enableMultiSelection: false,
          // Initialize category axis
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(),
          series: <RangeAreaSeries<Result, String>>[
            RangeAreaSeries<Result, String>(
              onPointTap: (details) {
                final pointsList = exchangeRate.results;
                final resultSelected = pointsList[details.pointIndex!];

                exchangeRateProvider.selectResult(
                  resultSelected,
                );
              },
              gradient: gradientColors,
              highValueMapper: (result, index) {
                if (exchangeRate.results.length > 1) {
                  return result.closed;
                }
                if (index == 0) {
                  return result.open;
                }
                if (index == 1) {
                  return result.closed;
                }
                return result.closed;
              },
              lowValueMapper: (sales, __) {
                return 0;
              },

              // Bind data source
              dataSource: exchangeRate.results,
              xValueMapper: (Result result, int index) {
                switch (state.currentTimeRange!) {
                  case TimeRange.oneDay:
                    String monthName = DateFormat('MMM').format(result.time);

                    return "$monthName ${result.time.day}";

                  case TimeRange.fiveDays:
                    String monthName = DateFormat('MMM').format(result.time);

                    return "$monthName ${result.time.day}";

                  case TimeRange.oneMonth:
                    String monthName = DateFormat('MMM').format(result.time);

                    return "$monthName ${result.time.day}";

                  case TimeRange.oneYear:
                    String monthName = DateFormat('MMM').format(result.time);
                    return "$monthName ${result.time.year}";

                  case TimeRange.twoYears:
                    String monthName = DateFormat('MMM').format(result.time);
                    return "$monthName ${result.time.year}";
                }
              },
            ),
          ]);
    });
  }
}
