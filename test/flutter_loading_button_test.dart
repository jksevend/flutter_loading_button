// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_loading_button/loading_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingButton.icon() display the icon and the child',
      (WidgetTester widgetTester) async {
    // Given
    LoadingButton loadingButton = LoadingButton.icon(
      onPressed: () async {},
      child: const Text('Test Button'),
      icon: const Icon(Icons.ac_unit),
      loadingWidget: const CircularProgressIndicator(),
    );

    // Given
    MaterialApp app = MaterialApp(
      home: Scaffold(
        body: loadingButton,
      ),
    );

    // When
    await widgetTester.pumpWidget(app);
    // Then
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets(
      'Tapping the button makes the (circular) loading widget appear after tapping and changes back to the button after a delayed task',
      (widgetTester) async {
    // Given
    LoadingButton loadingButton = LoadingButton(
      onPressed: () async {
        await Future.delayed(const Duration(seconds: 3), () => []);
      },
      child: const Text('Test Button'),
      loadingWidget: const CircularProgressIndicator(),
    );
    // Given
    MaterialApp app = MaterialApp(
      home: Scaffold(
        body: loadingButton,
      ),
    );
    // When
    await widgetTester.pumpWidget(app);

    // Tap the button
    await widgetTester.tap(find.byType(TextButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait
    await widgetTester.binding.delayed(const Duration(seconds: 3));

    // Button reappearing
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets(
      'Tapping the button makes the (linear) loading widget appear and changes back to the button after a delayed task',
      (widgetTester) async {
    // Given
    LoadingButton loadingButton = LoadingButton(
      onPressed: () async {
        await Future.delayed(const Duration(seconds: 3), () => []);
      },
      child: const Text('Test Button'),
      loadingWidget: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        child: const LinearProgressIndicator(),
      ),
    );
    // Given
    MaterialApp app = MaterialApp(
      home: Scaffold(
        body: loadingButton,
      ),
    );
    // When
    await widgetTester.pumpWidget(app);

    // Tap the button
    await widgetTester.tap(find.byType(TextButton));
    await widgetTester.pump();
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Wait
    await widgetTester.binding.delayed(const Duration(seconds: 3));

    // Button reappearing
    await widgetTester.pump();
    expect(find.byType(LinearProgressIndicator), findsNothing);
  });

  testWidgets(
      'Tapping the button makes the (custom) loading widget appear and changes back to the button after a delayed task',
      (widgetTester) async {
    // Given
    LoadingButton loadingButton = LoadingButton(
      onPressed: () async {
        await Future.delayed(const Duration(seconds: 3), () => []);
      },
      child: const Text('Test Button'),
      loadingWidget: Container(),
    );
    // Given
    MaterialApp app = MaterialApp(
      home: Scaffold(
        body: loadingButton,
      ),
    );
    // When
    await widgetTester.pumpWidget(app);

    // Tap the button
    await widgetTester.tap(find.byType(TextButton));
    await widgetTester.pump();
    expect(find.byType(Container), findsOneWidget);

    // Wait
    await widgetTester.binding.delayed(const Duration(seconds: 3));

    // Button reappearing
    await widgetTester.pump();
    expect(find.byType(Container), findsNothing);
  });
}
