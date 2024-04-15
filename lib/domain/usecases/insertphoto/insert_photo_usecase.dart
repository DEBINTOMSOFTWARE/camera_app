import 'dart:io';

abstract class InsertPhotoUseCase {
  Future<void> execute(String title, File image);
}
