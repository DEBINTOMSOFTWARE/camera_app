import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_app/presentation/widgets/camera_overlay.dart';

void main() {
  testWidgets('Aspect ratio test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CameraOverlay(),
      ),
    ));

    final aspectRatioContainer = find.byType(AspectRatio);
    expect(aspectRatioContainer, findsOneWidget);
  });
}