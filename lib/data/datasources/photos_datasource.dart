import 'package:camera_app/data/models/photo_data.dart';
import 'dart:io';

abstract class PhotosDataSource {
  Future<void> insertPhoto(String title, File image);

  Future<List<PhotoData>> getPhotos();
}
