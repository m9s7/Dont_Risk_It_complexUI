import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/tanks_left_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/pages/results_page.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/my_title.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/nav_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/progress_indicator/progress_sign.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/buttons_for_text_field_tanks_left_page/decrement_tanks_left_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/buttons_for_text_field_tanks_left_page/increment_tanks_left_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/attack_label.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/defence_label.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/dotted_line.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/example_body_text.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/example/example_heading_text.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/question_label.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/tanks_left_page/tanks_left_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TanksLeftPage extends StatefulWidget {
  final ResultPageParameters inputParameters;
  const TanksLeftPage({super.key, required this.inputParameters});

  @override
  State<TanksLeftPage> createState() => _TanksLeftPageState();
}

class _TanksLeftPageState extends State<TanksLeftPage> {
  late TextEditingController tanksLeftTextController;

  @override
  void initState() {
    tanksLeftTextController = TextEditingController(text: '1');
    super.initState();
  }

  void _leavingPageFunction() {
    widget.inputParameters.updateTanksLeft(
      newVal: MyFunctions.getAndSetValidTextFieldValue(
        controller: tanksLeftTextController,
        minVal: MyFunctions.minTanksLeftVal,
        maxVal: widget.inputParameters.atk,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          inputParameters: widget.inputParameters,
        ),
      ),
    );
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
        var layout = TanksLeftPageLayoutConstants(
          screenHeight: constraints.maxHeight,
          screenWidth: constraints.maxWidth,
        );

        return GestureDetector(
          onTap: () {
            MyFunctions.collapseKeyboard(context);
            MyFunctions.getAndSetValidTextFieldValue(
              controller: tanksLeftTextController,
              minVal: MyFunctions.minTanksLeftVal,
              maxVal: widget.inputParameters.atk,
            );
          },
          child: Container(
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
                      layout.fromQuestionLabelToProgressSighTop,
                  child: QuestionLabel(
                    height: layout.questionLabelHeight,
                    width: layout.questionLabelWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighDotDiameter +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecTankLeftTFButton(
                        diameter: layout.buttonForTextFieldDiameter,
                        controller: tanksLeftTextController,
                        maxVal: widget.inputParameters.atk,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: layout.minimalHeightUnit),
                        child: TanksLeftTextField(
                          height: layout.buttonForTextFieldDiameter,
                          width: layout.textFieldWidth,
                          controller: tanksLeftTextController,
                          maxVal: widget.inputParameters.atk,
                        ),
                      ),
                      IncTankLeftTFButton(
                        diameter: layout.buttonForTextFieldDiameter,
                        controller: tanksLeftTextController,
                        maxVal: widget.inputParameters.atk,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighDotDiameter +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/svg_s/Kamchatka_second_page.svg',
                    height: layout.kamchatkaHeight,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighDotDiameter +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/svg_s/Alaska_second_page.svg',
                    height: layout.alaskaHeight,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighDotDiameter +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop +
                      layout.fromDottedLineToKamchatkaTop,
                  left: layout.fromDottedLineStartToKamchatkaSide,
                  child: DottedLine(
                    dottedLineWidth: layout.dottedLineWidth,
                    dashHeight: layout.dashHeight,
                    dashWidth: layout.dashWidth,
                    dashToDashDistance: layout.dashToDashDistance,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop +
                      layout.fromCanRiskLabelToKamchatkaTop,
                  left: layout.fromCanRiskLabelToKamchatkaSide,
                  child: AttackLabel(
                    text: 'Tanks you can\nrisk losing',
                    height: layout.canRiskLabelHeight,
                    width: layout.canRiskLabelWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop +
                      layout.fromWontRiskLabelToKamchatkaTop,
                  left: layout.fromWontRiskLabelToKamchatkaSide,
                  child: AttackLabel(
                    text: "Tanks you won't\nrisk losing",
                    height: layout.wontRiskLabelHeight,
                    width: layout.wontRiskLabelWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromVectorToTextFieldTop +
                      layout.fromEnemyTanksLabelToAlaskaTop,
                  right: layout.fromEnemyTanksLabelToAlaskaSide,
                  child: DefenceLabel(
                    text: "Enemy tanks",
                    height: layout.enemyTanksLabelHeight,
                    width: layout.enemyTanksLabelWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromExampleHeadingTextToTfTop,
                  child: ExampleHeadingText(
                    height: layout.exampleHeadingTextHeight,
                    width: layout.exampleHeadingTextWidth,
                  ),
                ),
                Positioned(
                  top: layout.titleHeight +
                      layout.progressSighHeight +
                      layout.fromQuestionLabelToProgressSighTop +
                      layout.questionLabelHeight +
                      layout.fromTextFieldToQuestionlabelTop +
                      layout.textFieldHeight +
                      layout.fromExampleHeadingTextToTfTop +
                      layout.exampleHeadingTextHeight,
                  child: ExampleBodyText(
                    width: layout.exampleBodyTextWidth,
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding,
                  left: layout.sidePadding,
                  child: NavButton(
                    height: layout.navBtnHeight,
                    width: layout.navBtnWidth,
                    text: "Back",
                    onPressedFunc: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: layout.bottomPadding,
                  right: layout.sidePadding,
                  child: NavButton(
                    height: layout.navBtnHeight,
                    width: layout.navBtnWidth,
                    text: "Next",
                    onPressedFunc: _leavingPageFunction,
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
