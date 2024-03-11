import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:promodo/features/home/presentation/widgets/clock.widget.dart';


void main() {
  testWidgets('Text on clock should change once timer starts', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(
      const ProviderScope(child: ClockWidget()),
    );


    //  locate the Text widget with key  clockDisplayKey
    final textWidget = find.byKey(const ValueKey("clockDisplayKey"));

    // Verify that the Text widget is found
    expect(textWidget, findsOneWidget);

    //  extract its text initial value
    final textWidgetInstance = tester.widget<Text>(textWidget);
    final initialTextValue = textWidgetInstance.data;

    // Tap on the clock to start  timer
    tester.tap(find.byKey(const ValueKey("clockTappableContainer")));
    await tester.pump();

    // extract the value of the clockDisplayKey text again
    final nextTextValue = textWidgetInstance.data;

    // we expect that the initial and next values will be different if its working fine
    expect(initialTextValue, isNot(nextTextValue));
  });
}
