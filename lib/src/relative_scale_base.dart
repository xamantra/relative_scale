import 'package:flutter/material.dart';

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

typedef _RelativeBuilderFunction = Widget Function(
  BuildContext,
  double,
  double,
  double Function(double),
  double Function(double),
);

/// A relative builder specially made for stateless widget which can't
/// inherit from the mixin RelativeScale.
class RelativeBuilder extends StatelessWidget {
  /// Scale the sizes the way you want. Defaults to `1.0`.
  /// If `RelativeBuilder` turns your sizes a bit bigger or smaller
  /// you can decrease or increase the scale to match your expected sizes.
  final double scale;

  /// ## Parameters
  /// `context` - The [BuildContext] for this builder widget.
  ///
  /// `height` - The height of the screen.
  ///
  /// `width` - The width of the screen.
  ///
  /// `sy(double)` - A function which scales the value specified
  /// based on screen height.
  ///
  /// `sx(double)` - A function which scales the value specified
  /// based on screen width.
  ///
  /// ## Example
  /// ```dart
  /// builder: (context, height, width, sy, sx) {
  ///   return Container(
  ///     height: height,
  ///     width: width,
  ///     child: Text(
  ///       'Scaled Text!!',
  ///        style: TextStyle(fontSize: sy(12)),
  ///     ),
  ///   );
  /// }
  /// ```
  final _RelativeBuilderFunction builder;

  /// A relative builder specially made for stateless widget which can't
  /// inherit from the mixin RelativeScale.
  const RelativeBuilder({
    Key key,
    this.scale,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _RelativeBuilder(scale: scale, builder: builder);
  }
}

class _RelativeBuilder extends StatefulWidget {
  final double scale;
  final _RelativeBuilderFunction builder;

  const _RelativeBuilder({
    Key key,
    this.scale,
    this.builder,
  }) : super(key: key);

  @override
  _RelativeBuilderState createState() => _RelativeBuilderState();
}

class _RelativeBuilderState extends State<_RelativeBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _screenHeight,
      _screenWidth,
      _sy,
      _sx,
    );
  }

  Size get _size {
    return MediaQuery.of(context).size;
  }

  double get _screenHeight => _size.height;
  double get _screenWidth => _size.width;

  double _sy(double value) {
    return (_screenHeight * _calculate(value)).roundToDouble();
  }

  double _sx(double value) {
    return (_screenWidth * _calculate(value)).roundToDouble();
  }

  double _calculate(double value) {
    return ((value / 100) / 5.333333333333333) * (widget.scale ?? 1);
  }
}
