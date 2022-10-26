import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DecrementTextFieldButton extends StatefulWidget {
  final double diameter;
  final TextEditingController controller;
  final Color color;
  final int minVal;
  final int maxVal;

  const DecrementTextFieldButton({
    super.key,
    required this.diameter,
    required this.controller,
    required this.color,
    required this.minVal,
    required this.maxVal,
  });

  @override
  State<DecrementTextFieldButton> createState() => _TextFieldValueButtonState();
}

class _TextFieldValueButtonState extends State<DecrementTextFieldButton> {
  late Timer timer;
  late Function()? buttonFunction;

  @override
  void initState() {
    buttonFunction = () {
      MyFunctions.decrementTextFieldValue(
        controller: widget.controller,
        minVal: widget.minVal,
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
          backgroundColor: MaterialStateProperty.all<Color>(widget.color),
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
              Icons.arrow_drop_down_rounded,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
