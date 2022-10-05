import 'package:anjastore/constanta.dart';
import 'package:flutter/services.dart';

class AppLowerCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}

class AppUpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class AppRupiahText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    return newValue.copyWith(
      text: currencyFormatter.format(
        int.parse(newValue.text),
      ),
      selection: TextSelection.collapsed(
        offset: currencyFormatter
            .format(
              int.parse(newValue.text),
            )
            .length,
      ),
    );
  }
}
