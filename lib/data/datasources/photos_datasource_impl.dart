import 'package:camera_app/data/datasources/photos_datasource.dart';
import 'package:camera_app/data/db/database_helper.dart';
import 'package:camera_app/data/models/photo_data.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'dart:io';

class PhotosDataSourceImpl implements PhotosDataSource {
  final DatabaseHelper _databaseHelper;

  PhotosDataSourceImpl(this._databaseHelper);

  @override
  Future<List<PhotoData>> getPhotos() async {
    final db = await _databaseHelper.getDatabase();
    final data = await db.query('camera_photos');
    final photos = data
        .map((row) => PhotoData(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String)))
        .toList();
    return photos;
  }

  @override
  Future<void> insertPhoto(String title, File image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPhoto = PhotoData(title: title, image: copiedImage);
    final db = await _databaseHelper.getDatabase();
    await db.insert('camera_photos', {
      'id': newPhoto.id,
      'title': newPhoto.title,
      'image': newPhoto.image.path
    });
  }
}
