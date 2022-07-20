import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';

class ExchangeRateBlocWrapper extends StatelessWidget {
  const ExchangeRateBlocWrapper({
    Key? key,
    required this.child,
    this.exchangeRateBloc,
  }) : super(key: key);
  final Widget child;
  final ExchangeRateBloc? exchangeRateBloc;
  @override
  Widget build(BuildContext context) {
    final bloc = ExchangeRateBloc();
    return BlocProvider(
      create: (_) => exchangeRateBloc ?? bloc,
      child: child,
    );
  }
}
