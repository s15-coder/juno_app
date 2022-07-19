import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/models/exchange_rates_deault_time.dart';
import 'package:juno_app/widgets/rectangle_rounded_button.dart';

class DefaultTimesList extends StatelessWidget {
  const DefaultTimesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final exchangeRateBloc = BlocProvider.of<ExchangeRateBloc>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: size.width,
      height: 50,
      child: BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultTime(
                label: '2 Años',
                filled: state.currentTimeRange == TimeRange.twoYears,
                onTap: () => exchangeRateBloc.getExchangeRatesByTimeRange(
                  range: TimeRange.twoYears,
                ),
              ),
              DefaultTime(
                label: '1 Año',
                filled: state.currentTimeRange == TimeRange.oneYear,
                onTap: () => exchangeRateBloc.getExchangeRatesByTimeRange(
                  range: TimeRange.oneYear,
                ),
              ),
              DefaultTime(
                label: '1 Mes',
                filled: state.currentTimeRange == TimeRange.oneMonth,
                onTap: () => exchangeRateBloc.getExchangeRatesByTimeRange(
                  range: TimeRange.oneMonth,
                ),
              ),
              DefaultTime(
                label: '5 Días',
                filled: state.currentTimeRange == TimeRange.fiveDays,
                onTap: () => exchangeRateBloc.getExchangeRatesByTimeRange(
                  range: TimeRange.fiveDays,
                ),
              ),
              DefaultTime(
                label: '1 Día',
                filled: state.currentTimeRange == TimeRange.oneDay,
                onTap: () => exchangeRateBloc.getExchangeRatesByTimeRange(
                  range: TimeRange.oneDay,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DefaultTime extends StatelessWidget {
  const DefaultTime({
    Key? key,
    required this.label,
    this.filled = false,
    this.onTap,
  }) : super(key: key);
  final String label;
  final bool filled;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RectangleRoundedButton(
      onTap: onTap,
      filled: filled,
      label: label,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      fontSize: 15,
    );
  }
}
