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

class AppPhoneText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (newValue.text[0] != "0") {
      return newValue.copyWith(
        text: "0${newValue.text}",
        selection: TextSelection.collapsed(
          offset: "0${newValue.text}".length,
        ),
      );
    }
    return newValue.copyWith(
      text: newValue.text,
      selection: TextSelection.collapsed(
        offset: newValue.text.length,
      ),
    );
  }
}
