import 'package:flutter/cupertino.dart';

class MyFunctions {
  static const int minAtkVal = 2;
  static const int minDefVal = 1;
  static const int maxAtkVal = 999;
  static const int maxDefVal = 999;
  static const int minTanksLeftVal = 1;

  static int _getTextFieldValue(
    TextEditingController controller,
  ) {
    int currVal;
    try {
      currVal = int.parse(controller.text);
    } catch (e) {
      currVal = -1;
    }
    return currVal;
  }

  static bool _isValidValue(
    int currVal,
    int minVal,
    int maxVal,
  ) {
    if (currVal < minVal) return false;
    if (currVal > maxVal) return false;
    return true;
  }

  static int getValidTextFieldValue({
    required TextEditingController controller,
    required int minVal,
    required int maxVal,
  }) {
    int currVal = _getTextFieldValue(controller);
    if (_isValidValue(currVal, minVal, maxVal)) {
      return currVal;
    } else {
      return minVal;
    }
  }

  static void setTextFieldValue(
    TextEditingController controller,
    var newVal,
  ) {
    controller.text = newVal.toString();
  }

  static void clearTextField(
    TextEditingController controller,
  ) {
    controller.clear();
  }

  static void incrementTextFieldValue({
    required TextEditingController controller,
    required int minVal,
    required int maxVal,
  }) {
    int currVal = MyFunctions.getValidTextFieldValue(
      controller: controller,
      minVal: minVal,
      maxVal: maxVal,
    );
    if (currVal < maxVal) currVal++;
    setTextFieldValue(controller, currVal);
  }

  static void decrementTextFieldValue({
    required TextEditingController controller,
    required int minVal,
    required int maxVal,
  }) {
    int currVal = MyFunctions.getValidTextFieldValue(
      controller: controller,
      minVal: minVal,
      maxVal: maxVal,
    );
    if (currVal > minVal) currVal--;
    setTextFieldValue(controller, currVal);
  }

  static int getAndSetValidTextFieldValue({
    required TextEditingController controller,
    required int minVal,
    required int maxVal,
  }) {
    int currVal = MyFunctions.getValidTextFieldValue(
      controller: controller,
      minVal: minVal,
      maxVal: maxVal,
    );
    MyFunctions.setTextFieldValue(controller, currVal);
    return currVal;
  }

  static void collapseKeyboard(
    BuildContext context,
  ) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}
