import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:juno_app/widgets/default_times_list.dart';

import '../../test_wrappers/app_wrapper.dart';
import '../../test_wrappers/exchange_rate_bloc_wrapper.dart';
import '../../test_wrappers/media_query_wrapper.dart';

void main() {
  testWidgets("The required labels are shown", (tester) async {
    const widget = AppWrapperTest(child: DefaultTimesList());
    await tester.pumpWidget(widget);
    final oneDayFinder = find.text('1 Día');
    final fiveDaysFinder = find.text('5 Días');
    final oneMonthFinder = find.text('1 Mes');
    final oneYearFinder = find.text('1 Año');
    final twoYearsFinder = find.text('2 Años');
    expect(oneDayFinder, findsOneWidget);
    expect(fiveDaysFinder, findsOneWidget);
    expect(oneMonthFinder, findsOneWidget);
    expect(oneYearFinder, findsOneWidget);
    expect(twoYearsFinder, findsOneWidget);
  });
}
