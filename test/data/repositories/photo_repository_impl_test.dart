import 'dart:io';

import 'package:camera_app/data/datasources/photos_datasource.dart';
import 'package:camera_app/data/models/photo_data.dart';
import 'package:camera_app/domain/entities/photo.dart';
import 'package:camera_app/data/repositories/photo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPhotosDataSource extends Mock implements PhotosDataSource {
  @override
  Future<List<PhotoData>> getPhotos() async {
    return [
      PhotoData(id: '1', title: 'Photo 1', image: File('path/to/image1.jpg')),
      PhotoData(id: '2', title: 'Photo 2', image: File('path/to/image2.jpg')),
    ];
  }

  @override
  Future<void> insertPhoto(String title, File image) async {
  }
}

void main() {
  late PhotoRepositoryImpl photoRepository;
  late MockPhotosDataSource mockPhotosDataSource;

  setUp(() {
    mockPhotosDataSource = MockPhotosDataSource();
    photoRepository = PhotoRepositoryImpl(mockPhotosDataSource);
  });

  group('PhotoRepositoryImpl', () {
    group('getPhotos', () {
      test('should return a list of Photos', () async {
        // Act
        final photos = await photoRepository.getPhotos();

        // Assert
        expect(photos, equals([
          Photo(id: '1', title: 'Photo 1', image: File('path/to/image1.jpg')),
          Photo(id: '2', title: 'Photo 2', image: File('path/to/image2.jpg')),
        ]));
        verify(mockPhotosDataSource.getPhotos()).called(1);
      });
    });

    group('insertPhoto', () {
      test('should call insertPhoto on the data source', () async {
        // Arrange
        final mockImage = File('path/to/image.jpg');
        final mockTitle = 'New Photo';
        when(mockPhotosDataSource.insertPhoto(mockTitle, mockImage)).thenAnswer((_) async {});


        // Act
        await photoRepository.insertPhoto(mockTitle, mockImage);

        // Assert
        verify(mockPhotosDataSource.insertPhoto(mockTitle, mockImage)).called(1);
      });
    });
  });
}
