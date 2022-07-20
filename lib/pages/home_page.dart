import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/models/exchange_rate.dart';
import 'package:juno_app/widgets/custom_app_bar.dart';
import 'package:juno_app/widgets/custom_bottom_bar_navigator.dart';
import 'package:juno_app/widgets/default_times_list.dart';
import 'package:juno_app/widgets/selected_tdc_info_card.dart';
import 'package:juno_app/widgets/statistics_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final exchangeRateBloc = BlocProvider.of<ExchangeRateBloc>(context);
    exchangeRateBloc.getExchangeRatesByTimeRange(range: TimeRange.oneDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Column(
              children: const [
                CustomAppBar(),
                SelectedTdcInfoCard(),
                SizedBox(height: 30),
                StatisticsContainer(),
                DefaultTimesList(),
              ],
            ),
            const Positioned(bottom: 0, child: CustomBottomBarNavigator())
          ],
        ),
      ),
    );
  }
}
