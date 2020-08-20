import 'package:flutter_test/flutter_test.dart';

import 'widget.relative_builder.dart';
import 'widget.relative_scale.dart';

void main() {
  testWidgets('RelativeScale mixin test', (tester) async {
    await tester.pumpWidget(RelativeScaleWidget());
    await tester.pumpAndSettle();

    expect(tester.takeException(), null);
  });

  testWidgets('RelativeBuilder widget test', (tester) async {
    await tester.pumpWidget(RelativeBuilderWidget());
    await tester.pumpAndSettle();

    expect(tester.takeException(), null);
  });
}
