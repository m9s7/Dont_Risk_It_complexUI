import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';
import "package:auto_size_text/auto_size_text.dart";

class QuestionLabel extends StatelessWidget {
  final double height;
  final double width;

  const QuestionLabel({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AutoSizeText(
        "How many tanks would\nyou like to have after\nthe battle?",
        maxLines: 3,
        style: myTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
