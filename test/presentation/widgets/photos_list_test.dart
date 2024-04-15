import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_app/domain/entities/photo.dart';
import 'package:camera_app/presentation/widgets/photos_list.dart';
import 'dart:io';

void main() {
  group('PhotosList widget tests', () {
    testWidgets('Empty photos list displays no photos added message', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: PhotosList(photos: []),
        ),
      ));

      // Verify that the message is displayed
      expect(find.text('No Photos Added Yet.'), findsOneWidget);
    });

    testWidgets('Non-empty photos list displays grid view', (WidgetTester tester) async {
      final List<Photo> dummyPhotos = [
        Photo(id: '1', title: 'Photo 1', image: File('dummy_image_1.jpg')),
        Photo(id: '2', title: 'Photo 2', image: File('dummy_image_2.jpg')),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PhotosList(photos: dummyPhotos),
        ),
      ));

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(GridTile), findsNWidgets(dummyPhotos.length));
    });

    testWidgets('Each photo in the grid view displays its title', (WidgetTester tester) async {
      final List<Photo> dummyPhotos = [
        Photo(id: '1', title: 'Photo 1', image: File('dummy_image_1.jpg')),
        Photo(id: '2', title: 'Photo 2', image: File('dummy_image_2.jpg')),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PhotosList(photos: dummyPhotos),
        ),
      ));

      for (final photo in dummyPhotos) {
        expect(find.text(photo.title), findsOneWidget);
      }
    });
  });
}