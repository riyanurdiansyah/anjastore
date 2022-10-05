import 'package:anjastore/styles/app_color.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class AppStyleTextfield {
  static formInvoiceDateStyle({
    String? labelText,
    String? hintText,
    double? fontSize,
    VoidCallback? onTapDate,
  }) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      labelStyle: AppStyleText.stylePoppins(
        fontSize: fontSize,
      ),
      hintStyle: AppStyleText.stylePoppins(
        fontSize: fontSize,
        color: Colors.grey.shade400,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      fillColor: Colors.grey.shade200,
      filled: true,
      suffixIcon: InkWell(
        onTap: () => onTapDate!(),
        child: const Icon(
          Icons.date_range_rounded,
          color: Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static formInvoiceDescStyle({
    String? labelText,
    String? hintText,
    double? fontSize,
  }) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      labelText: labelText,
      labelStyle: AppStyleText.stylePoppins(
        fontSize: fontSize,
      ),
      hintStyle: AppStyleText.stylePoppins(
        fontSize: fontSize,
        color: Colors.grey.shade400,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
