import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ExampleBodyText extends StatelessWidget {
  final double width;

  const ExampleBodyText({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.contain,
        child: AutoSizeText.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: '5', style: myTextStyle.copyWith(color: atkColor)),
              const TextSpan(text: 'v'),
              TextSpan(
                text: '6',
                style: myTextStyle.copyWith(color: defColor.withRed(190)),
              ),
              const TextSpan(text: '\nTanks left: 2'),
            ],
          ),
          maxLines: 2,
          style: myTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
