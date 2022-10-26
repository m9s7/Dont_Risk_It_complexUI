import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const Label({
    super.key,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AutoSizeText(
        text,
        style: myTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
