import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/helpers/format_data.dart';
import 'package:juno_app/models/exchange_rate.dart';
import 'package:juno_app/models/result.dart';
import 'package:juno_app/widgets/tooltip_chart.dart';

import '../../test_wrappers/app_wrapper.dart';

void main() {
  late ExchangeRateBloc exchangeRateBloc;
  late Widget pumpWidget;
  final resultOne = Result(
    v: 200,
    vw: 201,
    open: 203,
    closed: 985623.025,
    h: 205,
    l: 206,
    time: DateTime.now(),
    n: 207,
  );
  final resultTwo = Result(
    v: 200,
    vw: 201,
    open: 203,
    closed: 2639.456,
    h: 205,
    l: 206,
    time: DateTime.now(),
    n: 207,
  );
  setUp(() {
    exchangeRateBloc = ExchangeRateBloc();
    final exchageRate = ExchangeRate(
      results: [resultOne, resultTwo],
      timeRange: TimeRange.oneDay,
    );
    exchangeRateBloc.add(OnStopFetchingData(exchangeRate: exchageRate));
    pumpWidget = AppWrapperTest(
      child: Container(),
      exchangeRateBloc: (exchangeRateBloc),
    );
  });
  group('Test getPointerCurrency function', () {
    testWidgets('First index', (tester) async {
      const index = 0;
      await tester.pumpWidget(pumpWidget);
      final currencyResult = getPointerCurrency(index);
      final currency = FormatData.valueCurrency(exchangeRateBloc.state
          .getCurrentExchangeRate()!
          .results[index]
          .closed);
      expect(currency, currencyResult);
    });
    testWidgets('Second index', (tester) async {
      const index = 1;
      await tester.pumpWidget(pumpWidget);
      final currencyResult = getPointerCurrency(index);
      final currency = FormatData.valueCurrency(exchangeRateBloc.state
          .getCurrentExchangeRate()!
          .results[index]
          .closed);
      expect(currency, currencyResult);
    });
  });
  group('Test getPointerDate function', () {
    testWidgets('First index', (tester) async {
      const index = 0;
      await tester.pumpWidget(pumpWidget);
      final dateResult = getPointerDate(index);
      final date = FormatData.getDateFormatted(
          exchangeRateBloc.state.getCurrentExchangeRate()!.results[index].time);
      expect(date, dateResult);
    });
    testWidgets('Second index', (tester) async {
      const index = 1;
      await tester.pumpWidget(pumpWidget);
      final dateResult = getPointerDate(index);
      final date = FormatData.getDateFormatted(
          exchangeRateBloc.state.getCurrentExchangeRate()!.results[index].time);
      expect(date, dateResult);
    });
  });
}
