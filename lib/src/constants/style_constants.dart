import 'package:flutter/material.dart';

TextStyle myTextStyle = const TextStyle(
  fontFamily: 'Sniglet',
  fontSize: 30,
  fontWeight: FontWeight.w500,
);

BorderRadius navBtnRadius = BorderRadius.circular(15.0);

BorderRadius exampleLabelRadius = BorderRadius.circular(10.0);

ButtonStyle roundBtnStyle = ButtonStyle(
  elevation: MaterialStateProperty.all<double>(5.0),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0.0)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(45.0),
    ),
  ),
);
