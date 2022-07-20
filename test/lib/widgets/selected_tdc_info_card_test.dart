import 'package:flutter_test/flutter_test.dart';
import 'package:juno_app/bloc/exchange_rate/exchange_rate_bloc.dart';
import 'package:juno_app/helpers/format_data.dart';
import 'package:juno_app/models/result.dart';
import 'package:juno_app/widgets/selected_tdc_info_card.dart';

import '../../test_wrappers/app_wrapper.dart';

void main() {
  testWidgets(
    "Default info is shown right",
    (WidgetTester tester) async {
      const pumpWidget = AppWrapperTest(child: SelectedTdcInfoCard());
      await tester.pumpWidget(pumpWidget);

      //Find default texts
      final copTextFinder = find.text('COP');
      final equalToText = find.text('= ------');
      final defaultDateText = find.text('--- / ---- / ------');

      expect(copTextFinder, findsOneWidget);
      expect(equalToText, findsOneWidget);
      expect(defaultDateText, findsOneWidget);
    },
  );
  testWidgets(
    "Data is shown right according to it's state",
    (WidgetTester tester) async {
      //Create the bloc and mock an state
      final bloc = ExchangeRateBloc();

      final result = Result(
        v: 200,
        vw: 201,
        open: 203,
        closed: 204,
        h: 205,
        l: 206,
        time: DateTime.now(),
        n: 207,
      );
      bloc.selectResult(result);

      final pumpWidget = AppWrapperTest(
        child: const SelectedTdcInfoCard(),
        exchangeRateBloc: bloc,
      );
      await tester.pumpWidget(pumpWidget);

      //Find default texts
      final copTextFinder = find.text('COP');
      final equalToText = find.text('= 1 USD');

      //Format date and get the text finder
      final formattedDate = FormatData.getDateFormatted(result.time);
      final dateFinder = find.text(formattedDate);

      //Format currency and get the text finder
      final formattedCurrency = FormatData.valueCurrency(result.closed);
      final finderCurrency = find.text(formattedCurrency);

      expect(copTextFinder, findsOneWidget);
      expect(equalToText, findsOneWidget);
      expect(dateFinder, findsOneWidget);
      expect(finderCurrency, findsOneWidget);
    },
  );
}
