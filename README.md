<p align="center"><img src="relative_scale.png"></p>

<p align="center">RelativeScale is a simple and custom sizing system for flutter widgets to achieve the same physical sizes across different devices.</p>

<p align="center">
<a href="https://pub.dev/packages/relative_scale" target="_blank"><img src="https://img.shields.io/pub/v/relative_scale" alt="Pub Version" /></a>
<a href="https://github.com/xamantra/relative_scale/actions?query=workflow%3ACI" target="_blank"><img src="https://github.com/xamantra/relative_scale/workflows/CI/badge.svg?event=push" alt="CI" /></a>
<a href="https://codecov.io/gh/xamantra/relative_scale"><img src="https://codecov.io/gh/xamantra/relative_scale/branch/master/graph/badge.svg" /></a>
<a href="https://pub.dev/packages/relative_scale/score" target="_blank"><img src="https://img.shields.io/badge/dynamic/json?color=blue&label=likes&query=likes&url=http://www.pubscore.gq/likes?package=relative_scale" alt="likes" /></a>
<a href="https://pub.dev/packages/relative_scale/score" target="_blank"><img src="https://img.shields.io/badge/dynamic/json?color=green&label=health&query=pub_points&url=http://www.pubscore.gq/pub-points?package=relative_scale" alt="health" /></a>
<a href="https://pub.dev/packages/relative_scale/score" target="_blank"><img src="https://img.shields.io/badge/dynamic/json?color=teal&label=popularity&query=popularity&url=http://www.pubscore.gq/popularity?package=relative_scale" alt="popularity" /></a>
<a href="https://github.com/xamantra/relative_scale/stargazers" target="_blank"><img src="https://img.shields.io/github/stars/xamantra/relative_scale" alt="GitHub stars" /></a>
<a href="https://github.com/tenhobi/effective_dart" target="_blank"><img src="https://img.shields.io/badge/style-effective_dart-54C5F8.svg" alt="style: effective dart" /></a>
<a href="https://github.com/xamantra/relative_scale/blob/master/LICENSE" target="_blank"><img src="https://img.shields.io/github/license/xamantra/relative_scale" alt="GitHub license" /></a>
<a href="https://github.com/xamantra/relative_scale/commits/master" target="_blank"><img src="https://img.shields.io/github/last-commit/xamantra/relative_scale" alt="GitHub last commit" /></a>
</p>

---

## Usage
It is VERY easy to use.

- `sy(value)` and `sx(value)`
- Example:
  - `sy(10`) - size relative to screen height.
  - `sx(10`) - size relative to screen width.

- `RelativeScale` - A StatefulWidget mixin that provides the scaling methods `sy` and `sx`.
- `RelativeBuilder` - A builder widget that provides the scaling methods `sy` and `sx`. This is more recommended than RelativeScale mixin.

<hr>

## Example
`RelativeBuilder` example.

```dart
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

<hr>

## Preview

The base screen size for these widgets is `480 x 800`. The source code for this preview app is [here](https://github.com/xamantra/flutter_relative_scale_example).

### Scaled with `RelativeScale`:

![Scaled](./preview/scaled.png)

Now, look at these scaled widgets with _RelativeScale_. There is a difference, yeah, but that's because of the system scaled sizes like the AppBar (look at the appbar's height :) ). Now let's forget about that and focus on the texts and the rectangle containers. They are the same sizes.

### Normal scaling from a flutter:

  ![Unscaled](./preview/unscaled.png)

  Now, for unscaled sizes, no _RelativeScale_ at all. Well, that's quite obvious :). Look at the texts on the last image, they are very small comparing to the first image. And the rectangle containers, very big difference.


The full example is in the [Example](https://pub.dev/packages/relative_scale#-example-tab-) section.

<hr>

## Scaling Notes

For instance, you have a container widget like this:

```Dart
Container(
    height: 300,
    width: 500,
)
```

and you implemented RelativeScale:

```Dart
Container(
    height: sy(300),
    width: sx(500),
)
```

they will not be the same size anymore, using relative scaler will make your sizes a bit bigger. But the hard work will payoff after adjusting your sizes because your app will now have the same widget sizes in every devices.

Please note that these scaler methods are relative to screen size. So basically in this case `sy(50)` and `sx(50)` is NOT the same size.

Also, another thing to note is that if you use `sy` for height and `sx` for width (or vice-versa), you'll get widgets with the same ratio (not size) which is still useful. The _Scaled_ preview image above uses only `sy`, and containers and text have the same size across different screens.

#### If you want to make a perfect _Square_ container, DON'T do this:

```Dart
Container(
    height: sy(300),
    width: sx(300),
)
// Yeah they are the same value "300", but they are not the same unit 'cause you used "sx" on the width.
```

#### DO this instead:

```Dart
Container(
    height: sy(300), // or sx(value)
    width: sy(300), // or sx(value)
)
```

Lastly, the library doesn't support orientation yet. If you designed your app for portrait and the user rotates the app to landscape view, the sizes will messed up. So if you want to use this library, it's highly recommended you lock the rotation. Or if your app should adapt to orientation, **DO NOT** use this library, there are a lot of alternatives.