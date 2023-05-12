import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/view/widget/homepage_component/top.dart';

void main() {
  testWidgets('TopWidget should contain greeting message and user avatar',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TopWidget(),
    ));
    // Find the greeting text
    expect(find.text('Hi, Sunshine!'), findsOneWidget);

    // Find the text for how the user is doing
    expect(find.text('How are you today?'), findsOneWidget);

    // Find the text with hope message
    expect(find.text('Hope your day is always shining like the sun'),
        findsOneWidget);

    // Find the user avatar
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
