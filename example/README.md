## StatefulWidget
For stateful widgets you can use the *mixin* `RelativeScale`.

```dart
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

// RelativeScaler is a mixin
class _ExampleState extends State<Example> with RelativeScale {
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
```

## StatelessWidget
For stateless widgets you can use the builder `RelativeBuilder`.

```dart
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, screenHeight, screenWidth, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'App Bar Title',
              style: TextStyle(fontSize: sy(13)),
            ),
          ),
          body: Container(
            height: screenHeight,
            width: screenWidth,
            child: Text(
              'Body Text',
              style: TextStyle(fontSize: sy(11)),
            ),
          ),
        );
      },
    );
  }
}
```