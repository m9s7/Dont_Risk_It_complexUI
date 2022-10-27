import 'package:dont_risk_it_ui2/src/constants/layout_constants/results_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ActionFeedbackIndicator extends StatelessWidget {
  final ResultsPageLayoutConstants layout;

  final bool tanksLostIndicator;
  final int numOfTanksLost;

  const ActionFeedbackIndicator({
    super.key,
    required this.layout,
    required this.tanksLostIndicator,
    required this.numOfTanksLost,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: layout.inTankValLabelHeight * 1.2,
      width: layout.inTankValLabelWidth * 1.2,
      child: AnimatedOpacity(
        opacity: tanksLostIndicator ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Text(
          "-${numOfTanksLost.toString()}",
          style: myTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
