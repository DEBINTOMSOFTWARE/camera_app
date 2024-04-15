import 'dart:io';
import 'package:camera_app/data/repositories/photo_respository.dart';
import 'package:camera_app/domain/usecases/insertphoto/insert_photo_usecase.dart';

class InsertPhotoUseCaseImpl implements InsertPhotoUseCase {
  final PhotoRepository _repository;

  InsertPhotoUseCaseImpl(this._repository);

  @override
  Future<void> execute(String title, File image) async {
    return await _repository.insertPhoto(title, image);
  }
}
