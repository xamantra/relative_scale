import 'package:flutter/widgets.dart';

mixin RelativeScale {
  double _screenHeight;
  double _screenWidth;

  /// `RelativeScale.screenHeight` -> the height of the screen.
  double get screenHeight => _screenHeight;

  /// `RelativeScale.screenWidth` -> the width of the screen.
  double get screenWidth => _screenWidth;

  /// Initialize `RelativeScale`.
  initRelativeScaler(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _screenHeight = size.height;
    _screenWidth = size.width;
  }

  /// Size relative to the `height` of the screen.
  double sy(double value) {
    return (_screenHeight * _calculate(value)).roundToDouble();
  }

  /// Size relative to the `width` of the screen.
  double sx(double value) {
    return (_screenWidth * _calculate(value)).roundToDouble();
  }

  double _calculate(double value) {
    return (value / 100) / 5.333333333333333;
  }
}
