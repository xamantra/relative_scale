import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ScaledExample extends StatefulWidget {
  ScaledExample({Key key}) : super(key: key);

  @override
  _ScaledExampleState createState() => _ScaledExampleState();
}

class _ScaledExampleState extends State<ScaledExample> with RelativeScale {
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: sy(160),
              width: sy(240),
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
              width: sy(280),
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
              width: sy(240),
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
