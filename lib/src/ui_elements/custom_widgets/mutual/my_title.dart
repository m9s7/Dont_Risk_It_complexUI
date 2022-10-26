import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final double height;

  const MyTitle({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AutoSizeText(
        "DON'T RISK IT",
        style: myTextStyle.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
