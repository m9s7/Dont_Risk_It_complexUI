import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/dash.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DottedLine extends StatelessWidget {
  late final double dottedLineWidth;
  late final double dashHeight;
  late final double dashWidth;
  late final double dashToDashDistance;

  late List<Dash> dottedLine;

  DottedLine({
    super.key,
    required this.dottedLineWidth,
    required this.dashHeight,
    required this.dashWidth,
    required this.dashToDashDistance,
  }) {
    _initDottedLine();
  }

  void _initDottedLine() {
    final Dash oneDash = Dash(
      dashHeight: dashHeight,
      dashWidth: dashWidth,
      dashToDashDistance: dashToDashDistance,
    );
    dottedLine = List.filled(_getNumOfDashLines(), oneDash);
  }

  int _getNumOfDashLines() {
    double dashWithPaddingWidth = _getDashWithRightPaddingWidth();
    return (dottedLineWidth / dashWithPaddingWidth).round();
  }

  double _getDashWithRightPaddingWidth() {
    return dashWidth + dashToDashDistance;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dashHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dottedLine,
      ),
    );
  }
}
