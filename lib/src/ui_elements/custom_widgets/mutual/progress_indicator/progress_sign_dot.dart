import 'package:flutter/material.dart';

class ProgressSignDot extends StatelessWidget {
  final Color color;
  final double diameter;

  const ProgressSignDot(
      {super.key, required this.color, required this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
    );
  }
}
