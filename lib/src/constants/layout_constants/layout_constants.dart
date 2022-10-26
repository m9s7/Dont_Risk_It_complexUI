class LayoutConstants {
  final double screenHeight;
  final double screenWidth;

  late double minimalHeightUnit;
  late double titleHeight;
  late double progressSighDotDiameter;
  late double progressSighHeight;
  late double progressSighWidth;
  late double navBtnHeight;
  late double navBtnWidth;
  late double buttonForTextFieldDiameter;
  late double sidePadding;
  late double bottomPadding;

  LayoutConstants(this.screenHeight, this.screenWidth) {
    _initLayoutConstants();
  }

  void _initLayoutConstants() {
    minimalHeightUnit = 0.015 * screenHeight;
    titleHeight = 0.069 * screenHeight;

    progressSighDotDiameter = 0.0125 * screenHeight;
    progressSighHeight = minimalHeightUnit;
    progressSighWidth = 6 * progressSighDotDiameter;

    navBtnHeight = 4 * minimalHeightUnit;
    navBtnWidth = 0.38 * screenWidth;

    buttonForTextFieldDiameter = 4 * minimalHeightUnit;

    sidePadding = 2 * minimalHeightUnit;
    bottomPadding = 2 * minimalHeightUnit;
  }
}
