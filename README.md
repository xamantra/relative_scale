# RelativeScale for Flutter

RelativeScaler is a simple and custom sizing system for flutter widgets to achieve the same physical sizes across different devices.

## Preview

[Scaled](https://i.imgur.com/t2o51ls.png)

[Unscaled](https://i.imgur.com/Qe0GNVk.png)

## Usage

It is VERY easy to use.

```Dart
// Usage in Stateful/State
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';


class ScaledExample extends StatefulWidget {
. . .

class _ScaledExampleState extends State<ScaledExample> with RelativeScaler {
  @override
  Widget build(BuildContext context) {
    // When you implement the RelativeScaler mixin, you have to initialize it
    // in order to use the scaler methods.
    initRelativeScaler(context);

    return Container(
      // "screenHeight" and "screenWidth" property is part of the mixin.
      height: screenHeight,
      width: screenWidth,
      child: Container(
        height: sy(160), // "sy" means size relative to device's screen height.
        width: sx(400), // "sx" means size relative to device's screen width.
        margin: EdgeInsets.all(sy(12)), // scaled margin.
        color: Colors.redAccent,
        child: Center(
          child: Text(
            "Scaled Text",
            style: TextStyle(
              fontSize: sy(24), // scaled font size.
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

```

Full example is in the [Example](https://pub.dev/packages/relative_scale#-example-tab-) section.

Now, this example is implemented in _Stateful->State_ widget. How about _Stateless_ widget?

Well, if you implement it on a stateless widget, you'll get an analyzer warning saying Stateless class is `immutable`. But the `RelativeScaler` mixin's properties are not final so it's mutable.

YOU CAN STILL USE the mixin in Stateless widget and run the app fine without problems actually.
It's just a linter warning but if you don't wanna see it, you can setup a custom analyzer options, like this:

`analysis_options.yaml` :

```yaml
analyzer:
  errors:
    must_be_immutable: ignore
```

This file must be in your project root directory. But please note that we're breaking dart rules here :) It's all on you.

## Scaling Notes

Ok so I'm pretty sure some or most of you is going to use this on existing projects.

For instance you have a container widget like this:

```Dart
Container(
    height: 300,
    width: 500,
)
```

and you implemented RelativeScaler:

```Dart
Container(
    height: sy(300),
    width: sx(500),
)
```

they will not be the same size anymore, using relative scaler will make your sizes a bit bigger. But the hard work will payoff after adjusting your sizes because your app will now have the same widget sizes in every screen size.

Please note that these scaler methods are relative to screen size. So basically in this case `sy(50)` and `sx(50)` is NOT the same size.

If you want to make a perfect _Square_ container, DON'T do this:

```Dart
Container(
    height: sy(300),
    width: sx(300),
)
// Yeah they are the same value "300", but they are not the same unit 'cause you used "sx" on the width.
```

DO this instead:

```Dart
Container(
    height: sy(300), // or sx(value)
    width: sy(300), // or sx(value)
)
```
