import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/helpers/format_data.dart';
import 'package:juno_app/main.dart';

Widget toolTipBuilder(
        data, dynamic point, dynamic series, int pointIndex, int seriesIndex) =>
    Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getPointerCurrency(pointIndex),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 2),
            Text(
              getPointerDate(pointIndex),
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ));
String getPointerCurrency(int index) {
  final exchangeRateProvider =
      BlocProvider.of<ExchangeRateBloc>(navigatorKey.currentState!.context);
  final exchangeRate = exchangeRateProvider.state.getCurrentExchangeRate();

  return FormatData.valueCurrency(exchangeRate.results[index].closed);
}

String getPointerDate(int index) {
  final exchangeRateProvider =
      BlocProvider.of<ExchangeRateBloc>(navigatorKey.currentState!.context);
  final exchangeRate = exchangeRateProvider.state.getCurrentExchangeRate();

  return FormatData.getDateFormatted(exchangeRate.results[index].time);
}
