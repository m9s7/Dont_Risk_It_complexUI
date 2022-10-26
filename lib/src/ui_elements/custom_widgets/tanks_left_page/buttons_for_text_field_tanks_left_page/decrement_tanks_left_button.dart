import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DecTankLeftTFButton extends StatefulWidget {
  final double diameter;
  final TextEditingController controller;
  final int maxVal;

  static const Color color = atkColor;

  const DecTankLeftTFButton({
    super.key,
    required this.diameter,
    required this.controller,
    required this.maxVal,
  });

  @override
  State<DecTankLeftTFButton> createState() => _TextFieldValueButtonState();
}

class _TextFieldValueButtonState extends State<DecTankLeftTFButton> {
  late Timer timer;

  late Function()? buttonFunction;

  @override
  void initState() {
    buttonFunction = () {
      MyFunctions.decrementTextFieldValue(
        controller: widget.controller,
        minVal: MyFunctions.minTanksLeftVal,
        maxVal: widget.maxVal,
      );
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.diameter,
      width: widget.diameter,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: roundBtnStyle.copyWith(
          backgroundColor:
              MaterialStateProperty.all<Color>(DecTankLeftTFButton.color),
        ),
        child: GestureDetector(
          onLongPress: () {
            timer = Timer.periodic(const Duration(milliseconds: 80), (t) {
              buttonFunction!();
            });
          },
          onLongPressUp: () => {timer.cancel()},
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              Icons.arrow_left_rounded,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
