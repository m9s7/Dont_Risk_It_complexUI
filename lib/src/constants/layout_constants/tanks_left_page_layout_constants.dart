import 'layout_constants.dart';

class TanksLeftPageLayoutConstants extends LayoutConstants {
  late double fromQuestionLabelToProgressSighTop;
  late double questionLabelHeight;
  late double questionLabelWidth;

  late double fromTextFieldToQuestionlabelTop;
  late double textFieldHeight;
  late double textFieldWidth;

  late double fromExampleHeadingTextToTfTop;
  late double exampleHeadingTextHeight;
  late double exampleHeadingTextWidth;
  late double exampleBodyTextWidth;

  late double fromVectorToTextFieldTop;
  late double kamchatkaHeight;
  late double kamchatkaWidth;
  late double alaskaHeight;
  late double alaskaWidth;

  late double canRiskLabelHeight;
  late double canRiskLabelWidth;
  late double fromCanRiskLabelToKamchatkaTop;
  late double fromCanRiskLabelToKamchatkaSide;

  late double wontRiskLabelHeight;
  late double wontRiskLabelWidth;
  late double fromWontRiskLabelToKamchatkaTop;
  late double fromWontRiskLabelToKamchatkaSide;

  late double enemyTanksLabelHeight;
  late double enemyTanksLabelWidth;
  late double fromEnemyTanksLabelToAlaskaTop;
  late double fromEnemyTanksLabelToAlaskaSide;

  late double dashHeight;
  late double dashWidth;
  late double dashToDashDistance;

  late double dottedLineWidth;
  late double fromDottedLineToKamchatkaTop;
  late double fromDottedLineStartToKamchatkaSide;
  late double fromDottedLineEndToAlaskaSide;

  TanksLeftPageLayoutConstants({
    screenHeight,
    screenWidth,
  }) : super(screenHeight, screenWidth) {
    _initTanksLeftLayoutPage();
  }

  void _initTanksLeftLayoutPage() {
    fromQuestionLabelToProgressSighTop = 3 * minimalHeightUnit;
    questionLabelWidth = screenWidth * 0.5875;
    questionLabelHeight = screenHeight * 0.12;

    fromTextFieldToQuestionlabelTop = 2 * minimalHeightUnit;
    textFieldWidth = screenWidth * 0.2225;
    textFieldHeight = screenHeight * 0.06;

    fromExampleHeadingTextToTfTop = screenHeight * 0.09;
    exampleHeadingTextWidth = screenWidth * 0.30;
    exampleHeadingTextHeight = screenHeight * 0.04;

    exampleBodyTextWidth = screenWidth * 0.18;

    fromVectorToTextFieldTop = screenHeight * 0.121;
    _determineContinentsHeight();

    canRiskLabelHeight = kamchatkaHeight * 0.1696;
    canRiskLabelWidth = kamchatkaWidth * 0.5512;
    fromCanRiskLabelToKamchatkaTop = kamchatkaHeight * 0.0324;
    fromCanRiskLabelToKamchatkaSide = kamchatkaWidth * 0.0833;

    wontRiskLabelHeight = canRiskLabelHeight;
    wontRiskLabelWidth = kamchatkaWidth * 0.64;
    fromWontRiskLabelToKamchatkaTop = kamchatkaHeight * 0.5395;
    fromWontRiskLabelToKamchatkaSide = kamchatkaWidth * 0.256;

    enemyTanksLabelHeight = alaskaHeight * 0.1046;
    enemyTanksLabelWidth = alaskaWidth * 0.6042;
    fromEnemyTanksLabelToAlaskaTop = alaskaHeight * 0.0983;
    fromEnemyTanksLabelToAlaskaSide = alaskaWidth * 0.04;

    dashHeight = screenHeight * 0.002613;
    dashWidth = screenWidth * 0.0172;
    dashToDashDistance = dashWidth / 2;

    fromDottedLineToKamchatkaTop = kamchatkaHeight * 0.39;
    fromDottedLineStartToKamchatkaSide =
        kamchatkaWidth * 0.76 + dashToDashDistance * 1.5;
    fromDottedLineEndToAlaskaSide = alaskaWidth * 0.85;
    dottedLineWidth = screenWidth -
        fromDottedLineStartToKamchatkaSide -
        fromDottedLineEndToAlaskaSide;
  }

  void _determineContinentsHeight() {
    double ogKamchatkaHeight = screenHeight * 0.381;
    double ogKamchatkaWidth = (ogKamchatkaHeight * 316) / 558;
    double ogAlaskaHeight = screenHeight * 0.35;
    double ogAlaskaWidth = (ogAlaskaHeight * 334) / 534;

    if (ogKamchatkaWidth + ogAlaskaWidth + minimalHeightUnit > screenWidth) {
      kamchatkaWidth = screenWidth * 0.5;
      kamchatkaHeight = (kamchatkaWidth * 277) / 155;
      alaskaWidth = screenWidth * 0.49;
      alaskaHeight = (alaskaWidth * 236) / 149;
    } else {
      kamchatkaHeight = ogKamchatkaHeight;
      kamchatkaWidth = ogKamchatkaWidth;
      alaskaHeight = ogAlaskaHeight;
      alaskaWidth = ogAlaskaWidth;
    }
  }
}
