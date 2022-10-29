import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/results_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:flutter/material.dart';

class LabelWithTextField extends StatelessWidget {
  final ResultsPageLayoutConstants layout;
  final TextEditingController controller;
  final int maxVal;

  final Function updateTanksLeftWinPercentFunc;

  const LabelWithTextField({
    super.key,
    required this.layout,
    required this.controller,
    required this.maxVal,
    required this.updateTanksLeftWinPercentFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 5.0),
          alignment: AlignmentDirectional.centerEnd,
          height: layout.winLabelHeight,
          width:
              (layout.screenWidthWithPadding - 1.5 * layout.winLabelHeight) / 2,
          child: AutoSizeText(
            "To win with",
            textAlign: TextAlign.right,
            style: myTextStyle,
          ),
        ),
        SizedBox(
          height: layout.winLabelHeight,
          width: 1.65 * layout.winLabelHeight,
          child: AutoSizeTextField(
            minFontSize: 1,
            onSubmitted: (text) =>
                updateTanksLeftWinPercentFunc(int.parse(text)),
            onTap: () => {MyFunctions.clearTextField(controller)},
            controller: controller,
            showCursor: false,
            autocorrect: false,
            inputFormatters: treeDigitInputFormaters,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            style: myTextStyle.copyWith(
              shadows: [
                const Shadow(
                  blurRadius: 7.0,
                  color: atkColor,
                  offset: Offset(-3.0, 0.0),
                ),
                const Shadow(
                  blurRadius: 3.0,
                  color: atkColor,
                  offset: Offset(-3.0, 0.0),
                ),
              ],
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: layout.winLabelHeight / 2,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.centerStart,
          height: layout.winLabelHeight,
          width:
              (layout.screenWidthWithPadding - 1.5 * layout.winLabelHeight) / 2,
          child: AutoSizeText(
            controller.text == '1' ? "tank left" : "tanks left",
            textAlign: TextAlign.right,
            style: myTextStyle,
          ),
        ),
      ],
    );
  }
}
