import 'package:juno_app/models/result.dart';

enum TimeRange { oneDay, fiveDays, oneMonth, oneYear, twoYears }

class ExchangeRate {
  final TimeRange? timeRange;
  final DateTime? timeEnd;
  final DateTime? timeStart;
  final List<Result> results;

  ExchangeRate({
    this.timeRange,
    required this.results,
    this.timeStart,
    this.timeEnd,
  }) : assert(timeRange != null || (timeStart != null && timeEnd != null));
}
