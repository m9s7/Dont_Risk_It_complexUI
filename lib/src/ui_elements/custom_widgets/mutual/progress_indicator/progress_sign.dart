import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/progress_indicator/progress_sign_dot.dart';
import 'package:flutter/material.dart';

class ProgressSign extends StatelessWidget {
  final MyPages page;

  final double height;
  final double width;
  final double dotDiameter;

  const ProgressSign({
    super.key,
    required this.page,
    required this.height,
    required this.width,
    required this.dotDiameter,
  });

  Color _getSecondDotColor() {
    if (page == MyPages.HOME_PAGE) return progressSignDotGrey;
    return progressSignDotGreen;
  }

  Color _getThirdDotColor() {
    if (page == MyPages.RESULTS_PAGE) return progressSignDotGreen;
    return progressSignDotGrey;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressSignDot(color: progressSignDotGreen, diameter: dotDiameter),
          SizedBox(
            width: dotDiameter,
            height: dotDiameter,
          ),
          ProgressSignDot(
            color: _getSecondDotColor(),
            diameter: dotDiameter,
          ),
          SizedBox(
            width: dotDiameter,
            height: dotDiameter,
          ),
          ProgressSignDot(
            color: _getThirdDotColor(),
            diameter: dotDiameter,
          ),
        ],
      ),
    );
  }
}
