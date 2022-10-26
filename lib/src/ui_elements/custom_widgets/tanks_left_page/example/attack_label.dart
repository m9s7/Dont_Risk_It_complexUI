import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AttackLabel extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const AttackLabel({
    super.key,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.08,
        horizontal: width * 0.04,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: exampleLabelRadius,
        color: atkColor.withOpacity(0.8),
      ),
      height: height,
      width: width,
      child: SizedBox(
        child: FittedBox(
          fit: BoxFit.contain,
          child: AutoSizeText(
            text,
            style: myTextStyle.copyWith(fontSize: 100),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
