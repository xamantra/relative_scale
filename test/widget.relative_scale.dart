import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class RelativeScaleWidget extends StatelessWidget {
  const RelativeScaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

// ignore: deprecated_member_use_from_same_package
class _TestWidgetState extends State<TestWidget> with RelativeScale {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initRelativeScaler(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: sy(30),
              width: sy(30),
            ),
            SizedBox(
              height: sx(30),
              width: sx(30),
            ),
          ],
        ),
      ),
    );
  }
}
