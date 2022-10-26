import 'package:dont_risk_it_ui2/src/constants/layout_constants/results_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/update_button.dart';
import 'package:flutter/material.dart';

class UpdateButtonRow extends StatelessWidget {
  final ResultsPageLayoutConstants layout;
  final Function onPressFunc;

  const UpdateButtonRow(
      {super.key, required this.onPressFunc, required this.layout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: layout.updateButtonHeight,
      width: layout.screenWidthWithPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UpdateButton(layout: layout, buttonVal: 0, onPressFunc: onPressFunc),
          UpdateButton(layout: layout, buttonVal: 1, onPressFunc: onPressFunc),
          UpdateButton(layout: layout, buttonVal: 2, onPressFunc: onPressFunc),
          UpdateButton(layout: layout, buttonVal: 3, onPressFunc: onPressFunc),
        ],
      ),
    );
  }
}
