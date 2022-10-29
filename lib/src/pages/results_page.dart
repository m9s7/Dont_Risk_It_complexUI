import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/results_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/engines/engine.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/my_title.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/progress_indicator/progress_sign.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/in_tank_value_label.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/label.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/label_with_text_field.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/reset_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/results_page/update_button_row.dart';

class ResultsPage extends StatefulWidget {
  final ResultPageParameters inputParameters;
  const ResultsPage({super.key, required this.inputParameters});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late TextEditingController tanksLeftTextController;

  late int atkVal;
  late int defVal;
  late int tanksLeftVal;

  late ClassicEngine engineWin;
  late ClassicEngine engineWinWithTanksLeft;

  late double winPercentage;
  late double winWithLeftPercentage;

  int atkTanksLost = 0;
  int defTanksLost = 0;
  bool isAtkAnimationPlaying = false;
  bool isDefAnimationPlaying = false;
  bool areButtonsDisabled = false;

  @override
  void initState() {
    atkVal = widget.inputParameters.atk;
    defVal = widget.inputParameters.def;
    tanksLeftVal = widget.inputParameters.tanksLeft;

    tanksLeftTextController =
        TextEditingController(text: tanksLeftVal.toString());

    engineWin = ClassicEngine(
      atk: atkVal,
      def: defVal,
      tanksLeft: 1,
    );
    winPercentage = engineWin.getResult(atkVal, defVal);

    engineWinWithTanksLeft = ClassicEngine(
      atk: atkVal,
      def: defVal,
      tanksLeft: tanksLeftVal,
    );
    winWithLeftPercentage = engineWinWithTanksLeft.getResult(atkVal, defVal);

    atkTanksLost = 0;
    defTanksLost = 0;
    isAtkAnimationPlaying = false;
    isDefAnimationPlaying = false;
    areButtonsDisabled = false;

    super.initState();
  }

  void onTanksLeftEditTF(int newVal) {
    var newEngine = ClassicEngine(
      atk: atkVal,
      def: defVal,
      tanksLeft: newVal,
    );
    var winPer = newEngine.getResult(atkVal, defVal);
    setState(() {
      tanksLeftVal = newVal;
      engineWinWithTanksLeft = newEngine;
      winWithLeftPercentage = winPer;
    });
  }

  indicateStateChanged(atkOld, atkNew, defOld, defNew) {
    if (atkOld != atkNew) {
      isAtkAnimationPlaying = true;
      atkTanksLost = atkOld - atkNew;
      Timer(const Duration(milliseconds: 1100), () {
        setState(() {
          isAtkAnimationPlaying = false;
        });
      });
    }
    if (defOld != defNew) {
      isDefAnimationPlaying = true;
      defTanksLost = defOld - defNew;
      Timer(const Duration(milliseconds: 1100), () {
        setState(() {
          isDefAnimationPlaying = false;
        });
      });
    }
  }

  void battleIsOverAction(newAtkVal, newDefVal) {
    areButtonsDisabled = true;
    if (newAtkVal <= 1) {
      setState(() {
        indicateStateChanged(atkVal, 1, defVal, newDefVal);
        atkVal = 1;
        defVal = newDefVal;
        winPercentage = 0.0;
        winWithLeftPercentage = 0.0;
      });
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text("Battle over, you lost! :)"),
        ),
      );
    } else {
      setState(() {
        indicateStateChanged(atkVal, newAtkVal, defVal, 0);
        atkVal = newAtkVal;
        defVal = 0;
        winPercentage = 100.0;
        winWithLeftPercentage = newAtkVal >= tanksLeftVal ? 100.0 : 0.0;
      });
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text("Battle over, you won! :)"),
        ),
      );
    }

    return;
  }

  void updateButtonOnPressFunc(int buttonVal) {
    if (ClassicEngine.isBattleOver(atkVal, defVal)) {
      battleIsOverAction(atkVal, defVal);
      return;
    }
    int k = ClassicEngine.getNumOfTotalTanksToBeLostInOneDiceRoll(
        atkVal - 1, defVal);
    buttonVal = buttonVal > k ? k : buttonVal;

    int atkToLose = buttonVal;
    int defToLose = k - atkToLose;

    int newAtkVal = atkVal - atkToLose;
    int newDefVal = defToLose <= 0 ? defVal : defVal - defToLose;

    if (ClassicEngine.isBattleOver(newAtkVal, newDefVal)) {
      battleIsOverAction(newAtkVal, newDefVal);
      return;
    }
    setState(() {
      indicateStateChanged(atkVal, newAtkVal, defVal, newDefVal);
      atkVal = newAtkVal;
      defVal = newDefVal;
      winPercentage = engineWin.getResult(newAtkVal, newDefVal);
      winWithLeftPercentage =
          engineWinWithTanksLeft.getResult(newAtkVal, newDefVal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        var layout = ResultsPageLayoutConstants(
          screenHeight: constraints.maxHeight,
          screenWidth: constraints.maxWidth,
        );

        return SingleChildScrollView(
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: Colors.transparent,
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  child: MyTitle(
                    height: layout.titleHeight,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight,
                  child: ProgressSign(
                    height: layout.progressSighHeight,
                    width: layout.progressSighWidth,
                    dotDiameter: layout.progressSighDotDiameter,
                    page: MyPages.TANKS_LEFT_PAGE,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop,
                  left: 0,
                  child: SvgPicture.asset(
                    "assets/svg_s/green_tank_third_page.svg",
                    width: layout.tankWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop,
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/svg_s/red_tank_third_page.svg",
                    width: layout.tankWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.fromInTankValLabelToTankTop,
                  left: layout.fromInTankValLabelToTankSide,
                  child: InTankValLabel(
                    value: atkVal,
                    color: atkColor,
                    height: layout.inTankValLabelHeight,
                    width: layout.inTankValLabelWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.fromInTankValLabelToTankTop,
                  right: layout.fromInTankValLabelToTankSide,
                  child: InTankValLabel(
                    value: defVal,
                    color: defColor,
                    height: layout.inTankValLabelHeight,
                    width: layout.inTankValLabelWidth,
                  ),
                ),
                isAtkAnimationPlaying
                    ? Positioned(
                        top: layout.titleHeight +
                            layout.progressSighHeight +
                            layout.fromProgressSignToTankTop +
                            layout.tankHeight,
                        left: layout.fromInTankValLabelToTankSide,
                        child: SizedBox(
                          height: layout.fromTankBottomToWinPercentageTop +
                              layout.winPercentageLabelHeight +
                              layout.winLabelHeight +
                              layout.fromWinLabelToWinPercentageLabel +
                              layout.winPercentageLabelHeight,
                          width: layout.inTankValLabelWidth * 2,
                          child: RiveAnimation.asset(
                            "assets/animations/green_tank_animation_loop_$atkTanksLost.riv",
                          ),
                        ),
                      )
                    : const SizedBox(),
                isDefAnimationPlaying
                    ? Positioned(
                        top: layout.titleHeight +
                            layout.progressSighHeight +
                            layout.fromProgressSignToTankTop +
                            layout.tankHeight,
                        right: layout.fromInTankValLabelToTankSide,
                        child: SizedBox(
                          height: layout.fromTankBottomToWinPercentageTop +
                              layout.winPercentageLabelHeight +
                              layout.winLabelHeight +
                              layout.fromWinLabelToWinPercentageLabel +
                              layout.winPercentageLabelHeight,
                          width: layout.inTankValLabelWidth * 2,
                          child: RiveAnimation.asset(
                            "assets/animations/red_tank_animation_loop_$defTanksLost.riv",
                          ),
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.tankHeight +
                      layout.fromTankBottomToWinPercentageTop,
                  child: Label(
                    text: "${winPercentage.toStringAsPrecision(3)}%",
                    height: layout.winPercentageLabelHeight,
                    width: layout.screenWidthWithPadding,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.tankHeight +
                      layout.fromTankBottomToWinPercentageTop +
                      layout.winPercentageLabelHeight,
                  child: Label(
                    text: "To win",
                    height: layout.winLabelHeight,
                    width: layout.screenWidthWithPadding,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.tankHeight +
                      layout.fromTankBottomToWinPercentageTop +
                      layout.winPercentageLabelHeight +
                      layout.winLabelHeight +
                      layout.fromWinLabelToWinPercentageLabel,
                  child: Label(
                    text: "${winWithLeftPercentage.toStringAsPrecision(3)}%",
                    height: layout.winPercentageLabelHeight,
                    width: layout.screenWidthWithPadding,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromProgressSignToTankTop +
                      layout.tankHeight +
                      layout.fromTankBottomToWinPercentageTop +
                      layout.winPercentageLabelHeight +
                      layout.winLabelHeight +
                      layout.fromWinLabelToWinPercentageLabel +
                      layout.winPercentageLabelHeight,
                  child: LabelWithTextField(
                    layout: layout,
                    controller: tanksLeftTextController,
                    maxVal: atkVal,
                    updateTanksLeftWinPercentFunc: onTanksLeftEditTF,
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding +
                      layout.resetButtonHeight +
                      layout.fromResetButtonToButtonBar +
                      layout.updateButtonHeight +
                      layout.fromButtonBarToHowManyLostLabel +
                      layout.howManyLostLabelHeight,
                  child: Label(
                    text: "Update your chances! ",
                    height: layout.updateLabelHeight,
                    width: layout.screenWidthWithPadding,
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding +
                      layout.resetButtonHeight +
                      layout.fromResetButtonToButtonBar +
                      layout.updateButtonHeight +
                      layout.fromButtonBarToHowManyLostLabel,
                  child: Label(
                    text: "How many tanks did you lose on this dice roll? ",
                    height: layout.howManyLostLabelHeight,
                    width: layout.screenWidthWithPadding,
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding +
                      layout.resetButtonHeight +
                      layout.fromResetButtonToButtonBar,
                  child: UpdateButtonRow(
                    layout: layout,
                    onPressFunc: isAtkAnimationPlaying ||
                            isDefAnimationPlaying ||
                            areButtonsDisabled
                        ? null
                        : updateButtonOnPressFunc,
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding,
                  child: ResetButton(
                    height: layout.resetButtonHeight,
                    width: layout.screenWidthWithPadding,
                    onPressFunc: () => {
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName))
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
