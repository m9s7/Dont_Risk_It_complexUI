import 'package:dont_risk_it_ui2/src/constants/colors_constants.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/functions.dart';
import 'package:dont_risk_it_ui2/src/constants/layout_constants/home_page_layout_constants.dart';
import 'package:dont_risk_it_ui2/src/pages/tanks_left_page.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/home_page/buttons_for_text_field_home_page.dart/decrement_text_field_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/home_page/buttons_for_text_field_home_page.dart/increment_text_field_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/home_page/in_tank_text_field.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/home_page/map_legend/map_legend.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/button_enums.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/my_title.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/nav_button.dart';
import 'package:dont_risk_it_ui2/src/ui_elements/custom_widgets/mutual/progress_indicator/progress_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController atkTextController;
  late TextEditingController defTextController;

  @override
  void initState() {
    atkTextController = TextEditingController(text: '9');
    defTextController = TextEditingController(text: '5');

    super.initState();
  }

  void _leavingPageFunction() {
    MyFunctions.collapseKeyboard(context);

    ResultPageParameters data = ResultPageParameters(
      atk: MyFunctions.getAndSetValidTextFieldValue(
        controller: atkTextController,
        minVal: MyFunctions.minAtkVal,
        maxVal: MyFunctions.maxAtkVal,
      ),
      def: MyFunctions.getAndSetValidTextFieldValue(
        controller: defTextController,
        minVal: MyFunctions.minDefVal,
        maxVal: MyFunctions.maxDefVal,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TanksLeftPage(
          inputParameters: data,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          var layout = HomePageLayoutConstants(
            screenHeight: constraints.maxHeight,
            screenWidth: constraints.maxWidth,
          );

          return GestureDetector(
            onTap: () {
              MyFunctions.collapseKeyboard(context);
              MyFunctions.getAndSetValidTextFieldValue(
                controller: atkTextController,
                minVal: MyFunctions.minAtkVal,
                maxVal: MyFunctions.maxAtkVal,
              );
              MyFunctions.getAndSetValidTextFieldValue(
                controller: defTextController,
                minVal: MyFunctions.minDefVal,
                maxVal: MyFunctions.maxDefVal,
              );
            },
            child: Container(
              color: Colors.transparent,
              height: layout.screenHeight,
              width: layout.screenWidth,
              child: Stack(
                children: [
                  Positioned(
                    bottom: layout.bottomPadding,
                    left: layout.sidePadding,
                    child: MapLegend(
                      height: layout.mapLegendHeight,
                      width: layout.mapLegendWidth,
                      squareSide: layout.mapLegendSquareSide,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: MyTitle(
                      height: layout.titleHeight,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight,
                    left: 0,
                    right: 0,
                    child: ProgressSign(
                      height: layout.progressSighHeight,
                      width: layout.progressSighWidth,
                      dotDiameter: layout.progressSighDotDiameter,
                      page: MyPages.HOME_PAGE,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank,
                    right: 0,
                    child: SvgPicture.asset(
                      "assets/svg_s/green_tank_first_page.svg",
                      height: layout.tankHeight,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.tankHeight +
                        layout.fromAtkTankToDeftank,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/svg_s/red_tank_first_page.svg",
                      height: layout.tankHeight,
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
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.fromInTankTextFieldToTankTop,
                    right: layout.fromInTankTextFieldToTankSide,
                    child: InTankTextField(
                      height: layout.inTankTextFieldHeight,
                      width: layout.inTankTextFieldWidth,
                      controller: atkTextController,
                      textFieldType: ActionType.ATK,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.tankHeight +
                        layout.fromAtkTankToDeftank +
                        layout.fromInTankTextFieldToTankTop,
                    left: layout.fromInTankTextFieldToTankSide,
                    child: InTankTextField(
                      height: layout.inTankTextFieldHeight,
                      width: layout.inTankTextFieldWidth,
                      controller: defTextController,
                      textFieldType: ActionType.DEF,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.fromButtonForTextFieldToTankTop,
                    left: layout.fromButtonForTextFieldToTankSide,
                    child: IncrementTextFieldButton(
                      diameter: layout.buttonForTextFieldDiameter,
                      controller: atkTextController,
                      color: atkColor,
                      minVal: MyFunctions.minAtkVal,
                      maxVal: MyFunctions.maxAtkVal,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.fromButtonForTextFieldToTankTop +
                        layout.buttonForTextFieldDiameter +
                        layout.minimalHeightUnit,
                    left: layout.fromButtonForTextFieldToTankSide,
                    child: DecrementTextFieldButton(
                      diameter: layout.buttonForTextFieldDiameter,
                      controller: atkTextController,
                      color: atkColor,
                      minVal: MyFunctions.minAtkVal,
                      maxVal: MyFunctions.maxAtkVal,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.tankHeight +
                        layout.fromAtkTankToDeftank +
                        layout.fromButtonForTextFieldToTankTop,
                    right: layout.fromButtonForTextFieldToTankSide,
                    child: IncrementTextFieldButton(
                      diameter: layout.buttonForTextFieldDiameter,
                      controller: defTextController,
                      color: defColor,
                      minVal: MyFunctions.minDefVal,
                      maxVal: MyFunctions.maxDefVal,
                    ),
                  ),
                  Positioned(
                    top: layout.titleHeight +
                        layout.minimalHeightUnit +
                        layout.fromProgressSingToAtkTank +
                        layout.tankHeight +
                        layout.fromAtkTankToDeftank +
                        layout.fromButtonForTextFieldToTankTop +
                        layout.buttonForTextFieldDiameter +
                        layout.minimalHeightUnit,
                    right: layout.fromButtonForTextFieldToTankSide,
                    child: DecrementTextFieldButton(
                      diameter: layout.buttonForTextFieldDiameter,
                      controller: defTextController,
                      color: defColor,
                      minVal: MyFunctions.minDefVal,
                      maxVal: MyFunctions.maxDefVal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
