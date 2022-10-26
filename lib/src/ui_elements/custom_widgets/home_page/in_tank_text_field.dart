import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:flutter/material.dart';

class InTankTextField extends StatefulWidget {
  final double height;
  final double width;

  final TextEditingController controller;

  final ActionType textFieldType;

  const InTankTextField({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    required this.textFieldType,
  });

  @override
  State<InTankTextField> createState() => _InTankTextFieldState();
}

class _InTankTextFieldState extends State<InTankTextField> {
  late Color color;

  late int minVal;

  late int maxVal;

  @override
  void initState() {
    if (widget.textFieldType == ActionType.ATK) {
      color = atkColor;
      minVal = MyFunctions.minAtkVal;
      maxVal = MyFunctions.maxAtkVal;
    }
    if (widget.textFieldType == ActionType.DEF) {
      color = defColor;
      minVal = MyFunctions.minDefVal;
      maxVal = MyFunctions.maxDefVal;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        onSubmitted: (text) {
          MyFunctions.getAndSetValidTextFieldValue(
            controller: widget.controller,
            minVal: minVal,
            maxVal: maxVal,
          );
        },
        onTap: () => {widget.controller.clear()},
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: treeDigitInputFormaters,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: myTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          height: 1,
        ),
        showCursor: false,
        autocorrect: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          contentPadding: EdgeInsets.only(
            bottom: widget.height / 2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
