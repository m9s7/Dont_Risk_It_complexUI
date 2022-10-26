import 'package:flutter/material.dart';

class MapLegendSquare extends StatelessWidget {
  final Color squareColor;
  final double squareSide;

  const MapLegendSquare({
    super.key,
    required this.squareSide,
    required this.squareColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: squareSide,
      height: squareSide,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: squareColor,
        ),
      ),
    );
  }
}
