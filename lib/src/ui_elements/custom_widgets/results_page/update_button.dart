import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/results_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/elevated_button.dart';
import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final ResultsPageLayoutConstants layout;
  final int buttonVal;
  final Function onPressFunc;

  const UpdateButton({
    super.key,
    required this.layout,
    required this.buttonVal,
    required this.onPressFunc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: layout.updateButtonHeight,
      width: layout.updateButtonWidth,
      child: MyElevatedButton(
        color: navBtnClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: layout.inTankValLabelHeight * 1.2,
          width: layout.inTankValLabelWidth * 1.2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: AutoSizeText(
              buttonVal.toString(),
              style: myTextStyle.copyWith(fontSize: 350, color: navBtnTxtClr),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
          onPressFunc(buttonVal);
        },
      ),
    );
  }
}
