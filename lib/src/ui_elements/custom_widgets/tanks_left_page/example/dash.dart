import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final double dashToDashDistance;

  const Dash({
    super.key,
    required this.dashHeight,
    required this.dashWidth,
    required this.dashToDashDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: dashToDashDistance),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: CustomPaint(
          size: Size(dashWidth, dashHeight),
        ),
      ),
    );
  }
}
