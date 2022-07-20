import 'package:flutter/material.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/main.dart';

import 'exchange_rate_bloc_wrapper.dart';
import 'media_query_wrapper.dart';

class AppWrapperTest extends StatelessWidget {
  const AppWrapperTest({
    Key? key,
    required this.child,
    this.exchangeRateBloc,
  }) : super(key: key);
  final Widget child;
  final ExchangeRateBloc? exchangeRateBloc;
  @override
  Widget build(BuildContext context) {
    return ExchangeRateBlocWrapper(
      exchangeRateBloc: exchangeRateBloc,
      child: MaterialApp(
          navigatorKey: navigatorKey,
          home: MediaQueryWrapper(
            child: child,
          )),
    );
  }
}
