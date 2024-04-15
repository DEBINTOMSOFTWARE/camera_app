import 'dart:io';
import 'package:camera_app/data/datasources/photos_datasource.dart';
import 'package:camera_app/data/datasources/photos_datasource_impl.dart';
import 'package:camera_app/data/models/photo_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:camera_app/data/db/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {
  @override
  Future<Database> getDatabase() async {
    final db = await openDatabase(
      ':memory:',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE camera_photos(id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
    );

    when(db.query('camera_photos')).thenAnswer((_) async => [
      {
        'id': 'photo1.jpg',
        'title': 'Photo 1',
        'image': 'path/to/image1.jpg',
      },
      {
        'id': 'photo2.jpg',
        'title': 'Photo 2',
        'image': 'path/to/image2.jpg',
      },
    ]);

    return db;
  }
}

void main() {
  late PhotosDataSource photosDataSource;
  late DatabaseHelper databaseHelper;

  setUp(() {
    databaseHelper = MockDatabaseHelper();
    photosDataSource = PhotosDataSourceImpl(databaseHelper);
  });

  test('getPhotos returns expected photos', () async {
    // Act
    final photos = await photosDataSource.getPhotos();

    // Assert
    expect(photos, [
      PhotoData(id: 'photo1.jpg', title: 'Photo 1', image: File('path/to/image1.jpg')),
      PhotoData(id: 'photo2.jpg', title: 'Photo 2', image: File('path/to/image2.jpg')),
    ]);
    verify(databaseHelper.getDatabase()).called(1);
    verify(databaseHelper.getDatabase().then((db) => db.query('camera_photos'))).called(1);
  });
}

