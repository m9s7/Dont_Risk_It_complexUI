import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:flutter/cupertino.dart';

class TanksLeftTextField extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController controller;
  final int maxVal;

  const TanksLeftTextField({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    required this.maxVal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AutoSizeTextField(
        controller: controller,
        showCursor: false,
        autocorrect: false,
        inputFormatters: treeDigitInputFormaters,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: myTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          height: 1,
        ),
        onTap: () => {MyFunctions.clearTextField(controller)},
        onSubmitted: (txt) {
          MyFunctions.getAndSetValidTextFieldValue(
            controller: controller,
            minVal: MyFunctions.minTanksLeftVal,
            maxVal: maxVal,
          );
        },
      ),
    );
  }
}
