import 'package:flutter_test/flutter_test.dart';
import 'package:juno_app/helpers/format_data.dart';

void main() {
  test('Test valueCurrency method', () {
    const valueOne = 552325;
    const valueTwo = 5523.5625;
    const valueThree = "5632653";

    final currencyOneFormatted = FormatData.valueCurrency(valueOne);
    const currencyOne = "\$552.325";
    expect(currencyOneFormatted, currencyOne);

    final currencyTwoFormatted = FormatData.valueCurrency(valueTwo);
    const currencyTwo = "\$5.523";
    expect(currencyTwoFormatted, currencyTwo);

    final currencyThreeFormatted = FormatData.valueCurrency(valueThree);
    const currencyThree = " \$0";
    expect(currencyThreeFormatted, currencyThree);
  });

  test('Test formatDateNumber method', () {
    const singleNumber = 1;
    final formattedSingleNumber = FormatData.formatDateNumber(singleNumber);
    expect(formattedSingleNumber, "01");
    const dobleNumber = 25;
    final formattedDoubleNumber = FormatData.formatDateNumber(dobleNumber);
    expect(formattedDoubleNumber, "25");
  });
  test('Test getFormattedDate method', () {
    final firstDate = DateTime(2022, 08, 3);
    final formattedFirstDate = FormatData.getDateFormatted(firstDate);
    expect(formattedFirstDate, "2022-08-03");

    final secondDate = DateTime(2018, 7, 24);
    final formattedSecondDate = FormatData.getDateFormatted(secondDate);
    expect(formattedSecondDate, "2018-07-24");
  });
}
