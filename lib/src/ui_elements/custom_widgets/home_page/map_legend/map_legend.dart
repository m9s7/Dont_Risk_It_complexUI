import 'package:auto_size_text/auto_size_text.dart';
import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/style_constants.dart';

import 'package:flutter/material.dart';
import 'map_legend_square.dart';

class MapLegend extends StatelessWidget {
  final double height;
  final double width;
  final double squareSide;

  const MapLegend({
    super.key,
    required this.height,
    required this.width,
    required this.squareSide,
  });

  Widget getOneMapLegendRow({
    required Color squareColor,
    required String labelText,
  }) {
    return SizedBox(
      height: height / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MapLegendSquare(
            squareSide: squareSide,
            squareColor: squareColor,
          ),
          AutoSizeText(
            '  -  ',
            style: myTextStyle,
          ),
          AutoSizeText(
            labelText,
            style: myTextStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getOneMapLegendRow(
            squareColor: atkColor,
            labelText: 'Attack',
          ),
          getOneMapLegendRow(
            squareColor: defColor,
            labelText: 'Defence',
          )
        ],
      ),
    );
  }
}
