import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/models/exchange_rate.dart';
import 'package:juno_app/models/result.dart';
import 'package:juno_app/widgets/statistics_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../test_wrappers/app_wrapper.dart';

void main() {
  final result = Result(
    v: 200,
    vw: 201,
    open: 203,
    closed: 204,
    h: 205,
    l: 206,
    time: DateTime.now(),
    n: 207,
  );
  const timeRange = TimeRange.oneDay;
  testWidgets(
    "CircularProgressIndicator is being shown at the beginning",
    (tester) async {
      const pumpWidget = AppWrapperTest(child: StatisticsChart());
      await tester.pumpWidget(pumpWidget);
      final loadingFinder = find.byType(CircularProgressIndicator);
      expect(loadingFinder, findsOneWidget);
    },
  );
  testWidgets("Chart is shown after fetch the data", (tester) async {
    final bloc = ExchangeRateBloc();
    final exchangeRate = ExchangeRate(
      results: [result, result],
      timeRange: timeRange,
    );
    final pumpWidget = AppWrapperTest(
      child: const StatisticsChart(),
      exchangeRateBloc: bloc,
    );
    await tester.pumpWidget(pumpWidget);

    //Loading state
    final loadingFinder = find.byType(CircularProgressIndicator);
    expect(loadingFinder, findsOneWidget);

    //Let's load the data
    bloc.add(OnStopFetchingData(exchangeRate: exchangeRate));

    //Data loaded
    final chartFinder = find.byType(SfCartesianChart);
    expect(loadingFinder, findsOneWidget);

    //Should not be loading anymore
    expect(chartFinder, findsNothing);
  });
}
