import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/config/config.dart';
import 'package:juno_app/helpers/format_data.dart';
import 'package:juno_app/widgets/custom_card.dart';
import 'package:juno_app/widgets/rectangle_rounded_button.dart';
import 'package:juno_app/widgets/styles/inputs.dart';

class SelectedTdcInfoCard extends StatelessWidget {
  const SelectedTdcInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
        builder: (context, state) {
          return CustomCard(
            margin: const EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(
                vertical: 30, horizontal: size.width * .05),
            width: size.width * 0.8,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FormatData.valueCurrency(state.selectedResult?.closed),
                      style: Inputs.h1(),
                    ),
                    const RectangleRoundedButton(
                      filled: true,
                      label: 'COP',
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        state.selectedResult != null ? '= 1 USD' : '= ------',
                        style: Inputs.h5(),
                      ),
                    ),
                    Text(
                      state.selectedResult != null
                          ? FormatData.getDateFormatted(
                              state.selectedResult!.time)
                          : '--- / ---- / ------',

                      // 'Nov 19th 4:20pm',
                      style: TextStyle(fontSize: 10, color: blueJuno),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
