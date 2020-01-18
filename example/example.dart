import 'package:flutter/material.dart';

import '../lib/relative_scale.dart';

class ScaledExample extends StatefulWidget {
  ScaledExample({Key key}) : super(key: key);

  @override
  _ScaledExampleState createState() => _ScaledExampleState();
}

// RelativeScaler is a mixin
class _ScaledExampleState extends State<ScaledExample> with RelativeScaler {
  @override
  Widget build(BuildContext context) {
    // this is very important, you should always call this whenever you implement RelativeScaler on a widget.
    initRelativeScaler(context);

    /* You'll see "sy" and "sx" below: */
    /* which means "sy" = size relative to height of the screen. */
    /* which means "sx" = size relative to width of the screen. */

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: sy(160),
              width: sx(400),
              margin: EdgeInsets.all(sy(12)),
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  "Scaled Text 1",
                  style: TextStyle(
                    fontSize: sy(24),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: sy(80),
              width: sx(450),
              margin: EdgeInsets.all(sy(12)),
              color: Colors.green,
              child: Center(
                child: Text(
                  "Scaled Text 2",
                  style: TextStyle(
                    fontSize: sy(24),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: sy(120),
              width: sx(400),
              margin: EdgeInsets.all(sy(12)),
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Scaled Text 3",
                  style: TextStyle(
                    fontSize: sy(24),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
