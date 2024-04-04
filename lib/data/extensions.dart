import 'package:bloc_architecture/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Format price
  String get formatPrice {
    // Check enpty string
    if (isEmpty) return '0,00';
    // Format currency
    final formatCurrency = NumberFormat('#,##0.#######', 'en_US');
    if (int.tryParse(this) != null) {
      return formatCurrency.format(int.parse(this)).replaceAll(',', ' ');
    } else {
      return formatCurrency
          .format(double.parse(replaceAll(Constants.regexZero, '')))
          .replaceAll(',', ' ')
          .replaceAll('.', ',');
    }
  }
}

extension StyleExtension on BuildContext {
  /// Get theme
  ThemeData get theme => Theme.of(this);

  /// is dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Get title style
  TextStyle get titleStyle => TextStyle(
        color: titleColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  /// Get subtitle style
  TextStyle get subtitleStyle => TextStyle(
        color: subtitleColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );
}

extension ColorExtension on BuildContext {
  /// Get green color
  Color get greenColor => HexColor('#C8FC01');

  /// Get title color
  Color get titleColor => isDarkMode ? Colors.white : Colors.black;

  /// Get subtitle color
  Color get subtitleColor => (isDarkMode ? Colors.white : Colors.black).withOpacity(.5);
}
