import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class RelativeBuilderWidget extends StatelessWidget {
  const RelativeBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: height,
          width: width,
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
      },
    );
  }
}
