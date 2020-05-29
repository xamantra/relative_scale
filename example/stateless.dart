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
