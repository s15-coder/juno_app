import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/bloc/theme/theme_cubit.dart';
import 'package:juno_app/pages/home_page.dart';
import 'package:juno_app/routes/routes.dart';
import 'package:juno_app/theme/dark/dark_theme.dart';
import 'package:juno_app/theme/light/light_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ExchangeRateBloc()),
        BlocProvider(create: (_) => ThemeCubit())
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'Juno App',
          routes: routes(),
          initialRoute: HomePage.routeName,
          themeMode:
              state == ThemeState.light ? ThemeMode.light : ThemeMode.dark,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
