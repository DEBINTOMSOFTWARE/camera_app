import 'dart:io';
import 'package:camera_app/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<void> insertPhoto(String title, File image);

  Future<List<Photo>> getPhotos();
}
