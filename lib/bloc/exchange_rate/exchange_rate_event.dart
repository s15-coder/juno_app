part of 'exchange_rate_bloc.dart';

@immutable
abstract class ExchangeRateEvent {}

class InitialExchangeRate extends ExchangeRateEvent {}

class OnChangeTimeRange extends ExchangeRateEvent {
  final TimeRange currentRangeTime;
  OnChangeTimeRange({required this.currentRangeTime});
}

class OnStartFetchingData extends ExchangeRateEvent {
  final TimeRange currentRangeTime;
  OnStartFetchingData({required this.currentRangeTime});
}

class OnStopFetchingData extends ExchangeRateEvent {
  final ExchangeRate exchangeRate;
  OnStopFetchingData({required this.exchangeRate});
}

class OnSelectResult extends ExchangeRateEvent {
  final Result result;
  OnSelectResult({
    required this.result,
  });
}
