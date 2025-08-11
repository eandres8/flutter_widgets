import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.blueGrey,
  Colors.purple,
  Colors.red,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor > 0, 'Selected color must be greater than 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );
}
