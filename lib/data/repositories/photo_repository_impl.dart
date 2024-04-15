import 'dart:io';

import 'package:camera_app/data/datasources/photos_datasource.dart';
import 'package:camera_app/data/models/photo_data.dart';
import 'package:camera_app/data/repositories/photo_respository.dart';
import 'package:camera_app/domain/entities/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotosDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final List<PhotoData> photoDataList = await _dataSource.getPhotos();
    return photoDataList.map((photoData) {
      return Photo(
          id: photoData.id, title: photoData.title, image: photoData.image);
    }).toList();
  }

  @override
  Future<void> insertPhoto(String title, File image) async {
    await _dataSource.insertPhoto(title, image);
  }
}
