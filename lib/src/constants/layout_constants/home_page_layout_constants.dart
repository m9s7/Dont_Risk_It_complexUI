import 'package:dont_risk_it_ui2/src/constants/layout_constants/layout_constants.dart';

class HomePageLayoutConstants extends LayoutConstants {
  late double fromProgressSingToAtkTank;
  late double tankHeight;
  late double tankWidth;
  late double inTankTextFieldHeight;
  late double inTankTextFieldWidth;
  late double fromInTankTextFieldToTankTop;
  late double fromInTankTextFieldToTankSide;
  late double fromButtonForTextFieldToTankTop;
  late double fromButtonForTextFieldToTankSide;
  late double fromAtkTankToDeftank;
  late double mapLegendSquareSide;
  late double mapLegendHeight;
  late double mapLegendWidth;

  HomePageLayoutConstants({screenHeight, screenWidth})
      : super(screenHeight, screenWidth) {
    tankHeight = _determineTankHeight();
    tankWidth = (tankHeight * 356) / 242;

    inTankTextFieldHeight = screenHeight * 0.06;
    inTankTextFieldWidth = tankWidth * 0.25;

    fromProgressSingToAtkTank = 4 * minimalHeightUnit;
    fromInTankTextFieldToTankTop = (124 / 242) * tankHeight;
    fromInTankTextFieldToTankSide = 11 * tankWidth / 356;
    fromButtonForTextFieldToTankTop = 0.44 * tankHeight;
    fromButtonForTextFieldToTankSide = sidePadding;
    fromAtkTankToDeftank = 2 * minimalHeightUnit;

    mapLegendSquareSide = minimalHeightUnit;
    mapLegendHeight = 4 * minimalHeightUnit;
    mapLegendWidth = 0.27 * screenWidth;
  }

  /*
    The height of the SVG tank cut out is idealy 33% of the safe screen height.
    The height to width ratio of the SVG tank cut out is 242/356 per original design.
    That poses a problem sometimes, because the width of the tank can be larger than the width of the screen.
    This function reduces the size of the tank to properly fit on the screen.
  */
  double _determineTankHeight() {
    // I want to have the barrel of the tank at least 3% from the side of the screen at all times.
    double tankHeight = ((screenWidth - (sidePadding)) * 242) / 356;

    if (tankHeight > 0.33 * screenHeight) {
      return 0.33 * screenHeight;
    } else {
      return tankHeight;
    }
  }
}
