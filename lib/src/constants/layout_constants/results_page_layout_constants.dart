import 'package:dont_risk_it_ui2/src/constants/layout_constants/layout_constants.dart';

class ResultsPageLayoutConstants extends LayoutConstants {
  late double fromProgressSignToTankTop;
  late double tankHeight;
  late double tankWidth;
  late double inTankValLabelHeight;
  late double inTankValLabelWidth;
  late double fromInTankValLabelToTankTop;
  late double fromInTankValLabelToTankSide;
  late double fromTankBottomToWinPercentageTop;
  late double winPercentageLabelHeight;
  late double winLabelHeight;
  late double fromWinLabelToWinPercentageLabel;
  late double updateLabelHeight;
  late double howManyLostLabelHeight;
  late double fromButtonBarToHowManyLostLabel;
  late double updateButtonHeight;
  late double updateButtonWidth;
  late double fromResetButtonToButtonBar;
  late double resetButtonHeight;
  late double screenWidthWithPadding;

  ResultsPageLayoutConstants(
      {required double screenHeight, required double screenWidth})
      : super(screenHeight, screenWidth) {
    _initResultsPageLayoutConstants();
  }

  void _initResultsPageLayoutConstants() {
    fromProgressSignToTankTop = 3 * minimalHeightUnit;
    tankWidth = screenWidth * 0.46;
    tankHeight = tankWidth * 88 / 153;

    inTankValLabelHeight = tankHeight * 0.2273;
    inTankValLabelWidth = tankWidth * 0.2614;
    fromInTankValLabelToTankTop = tankHeight * 0.495;
    fromInTankValLabelToTankSide = tankWidth * 0.16;

    fromTankBottomToWinPercentageTop = 2 * minimalHeightUnit;

    winPercentageLabelHeight = screenHeight * 0.1;
    winLabelHeight = winPercentageLabelHeight / 2.2;

    fromWinLabelToWinPercentageLabel = 2 * minimalHeightUnit;

    updateLabelHeight = screenHeight * 0.05;
    howManyLostLabelHeight = screenHeight * 0.035;
    fromButtonBarToHowManyLostLabel = minimalHeightUnit;
    updateButtonHeight = screenWidth * 0.12;
    updateButtonWidth = updateButtonHeight;

    fromResetButtonToButtonBar = 2 * minimalHeightUnit;

    resetButtonHeight = navBtnHeight;
    screenWidthWithPadding = screenWidth - 2 * sidePadding;
  }
}
