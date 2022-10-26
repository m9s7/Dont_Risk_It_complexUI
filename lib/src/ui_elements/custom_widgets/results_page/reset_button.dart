import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final double height;
  final double width;
  final Function()? onPressFunc;

  const ResetButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressFunc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: navBtnClr.withOpacity(0.85),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          side: BorderSide(width: 2, color: navBtnClr.withOpacity(0.5)),
        ),
        onPressed: onPressFunc,
        child: AutoSizeText(
          'Reset',
          style: myTextStyle.copyWith(fontSize: 100),
        ),
      ),
    );
  }
}
