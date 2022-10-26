import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ExampleHeadingText extends StatelessWidget {
  final double height;
  final double width;

  const ExampleHeadingText({
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
        'Example',
        style: myTextStyle.copyWith(fontSize: 100),
        textAlign: TextAlign.center,
      ),
    );
  }
}
