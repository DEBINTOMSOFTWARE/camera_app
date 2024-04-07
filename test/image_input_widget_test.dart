import 'package:camera_app/presentation/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  late MockImagePicker mockImagePicker;

  setUp(() {
    mockImagePicker = MockImagePicker();
  });

  testWidgets('ImageInput displays "Take Picture" button initially',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ImageInput(
          onPickedImage: (_) {},
        ),
      ),
    ));

    expect(find.text('Take Picture'), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('ImageInput displays selected image after taking picture',
      (WidgetTester tester) async {


    final File selectedImage = File('/data/user/0/com.example.camera_app/cache/scaled_6c574e13-6c34-432d-a4b3-380c65ccfc2c7574133447742325100.jpg');
    final XFile xFile = XFile(selectedImage.path);

    when(mockImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600))
        .thenAnswer((_) async => xFile);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ImageInput(
          onPickedImage: (_) {},
        ),
      ),
    ));

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.text('Take Picture'), findsNothing);
    expect(find.byType(Image), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image is FileImage &&
            (widget.image as FileImage).file.path == selectedImage.path),
        findsOneWidget);
  });
}
