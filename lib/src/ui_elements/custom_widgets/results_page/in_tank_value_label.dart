import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class InTankValLabel extends StatelessWidget {
  final Color color;
  final int value;
  final double height;
  final double width;

  const InTankValLabel({
    super.key,
    required this.value,
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: AutoSizeText(
        value.toString(),
        style: myTextStyle.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
