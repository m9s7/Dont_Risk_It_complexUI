import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/elevated_button.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text;
  final Function()? onPressedFunc;
  final double height;
  final double width;

  const NavButton({
    super.key,
    required this.text,
    required this.onPressedFunc,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MyElevatedButton(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        color: navBtnClr,
        shape: RoundedRectangleBorder(
          borderRadius: navBtnRadius,
        ),
        onPressed: onPressedFunc,
        child: FittedBox(
          fit: BoxFit.contain,
          child: AutoSizeText(
            text,
            style: myTextStyle.copyWith(color: navBtnTxtClr),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
