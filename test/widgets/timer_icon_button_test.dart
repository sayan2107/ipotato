import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/widgets/timer_icon_button.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: TimerIconButton(
          icon: Icons.pause,
          onTap: null,
        ),
      ),
    ));

    expect(find.byIcon(Icons.pause), findsOneWidget);
  });
}
