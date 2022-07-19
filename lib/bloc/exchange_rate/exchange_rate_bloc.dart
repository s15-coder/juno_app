import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juno_app/helpers/format_data.dart';
import 'package:juno_app/models/exchange_rates_deault_time.dart';
import 'package:juno_app/models/responses/exchange_rates_response.dart';
import 'package:juno_app/models/result_model.dart';
import 'package:juno_app/services/polygon_api.dart';
import 'package:meta/meta.dart';

part 'exchange_rate_event.dart';
part 'exchange_rate_state.dart';

class ExchangeRateBloc extends Bloc<ExchangeRateEvent, ExchangeRateState> {
  ExchangeRateBloc() : super(const ExchangeRateState()) {
    // on<ExchangeRateEvent>((event, emit) {});

    on<OnStartFetchingData>((event, emit) => emit(state.copyWith(
          fetchingNewData: true,
          currentTimeRange: event.currentRangeTime,
        )));

    on<OnStopFetchingData>((event, emit) {
      final defaultExchangeRates = [
        ...state.exchangeRatesDefaultTime,
        event.exchangeRate
      ];
      emit(state.copyWith(
          fetchingNewData: false,
          exchangeRatesDefaultTime: defaultExchangeRates));
    });
    on<OnChangeTimeRange>((event, emit) {
      emit(state.copyWith(currentTimeRange: event.currentRangeTime));
    });
    on<OnSelectResult>((event, emit) {
      emit(state.copyWith(
        selectedResult: event.result,
      ));
    });
  }

  void selectResult(Result result) {
    add(OnSelectResult(result: result));
  }

  Future getExchangeRatesByTimeRange({required TimeRange range}) async {
    final cachedExchangeRate = state.getCachedExchangeRate(range);
    if (cachedExchangeRate != null) {
      add(OnChangeTimeRange(currentRangeTime: range));
      add(OnSelectResult(result: cachedExchangeRate.results.first));
      return;
    }
    try {
      final dateFormat = FormatData.getTimeStringByRange(range);
      final nowFormat = FormatData.getDateFormatted(DateTime.now());
      add(OnStartFetchingData(currentRangeTime: range));

      final resp = await PolygonApi.httpGet(
          'C:USDCOP/range/1/day/$dateFormat/$nowFormat?adjusted=true&sort=asc&');
      final responseBody =
          ExchangeRatesResponse.fromJson(jsonDecode(resp.body));
      final newExchangeRate = ExchangeRate(
        results: responseBody.results,
        timeRange: range,
      );
      add(OnSelectResult(result: newExchangeRate.results.first));
      add(OnStopFetchingData(exchangeRate: newExchangeRate));
    } catch (e) {
      log("Error fetching exchange rates: $e");
    }
  }
}
