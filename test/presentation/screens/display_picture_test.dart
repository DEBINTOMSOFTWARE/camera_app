import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_app/presentation/screens/display_picture.dart';

void main() {
  testWidgets('App bar title test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DisplayPictureScreen(imagePath: '/path/to/image', onPhotoSaved: () {}),
    ));
    expect(find.text('Display Picture'), findsOneWidget);
  });

  testWidgets('Image display test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DisplayPictureScreen(imagePath: '/path/to/image', onPhotoSaved: () {}),
    ));
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Text field test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DisplayPictureScreen(imagePath: '/path/to/image', onPhotoSaved: () {}),
    ));
    expect(find.byType(TextField), findsOneWidget);
  });
}