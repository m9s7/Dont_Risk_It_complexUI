import 'package:flutter/services.dart';

var treeDigitInputFormaters = <TextInputFormatter>[
  FilteringTextInputFormatter.allow(
    RegExp('[0-9]'),
  ),
  LengthLimitingTextInputFormatter(3),
];

enum ActionType {
  // ignore: constant_identifier_names
  ATK,
  // ignore: constant_identifier_names
  DEF,
}

class ResultPageParameters {
  final int atk;
  final int def;
  int tanksLeft;

  ResultPageParameters({
    required this.atk,
    required this.def,
    this.tanksLeft = 1,
  });

  void updateTanksLeft({required int newVal}) {
    tanksLeft = newVal;
  }
}

enum MyPages {
  // ignore: constant_identifier_names
  HOME_PAGE,
  // ignore: constant_identifier_names
  TANKS_LEFT_PAGE,
  // ignore: constant_identifier_names
  RESULTS_PAGE,
}
