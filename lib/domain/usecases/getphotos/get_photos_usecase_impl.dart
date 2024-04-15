import 'package:camera_app/data/repositories/photo_respository.dart';
import 'package:camera_app/domain/entities/photo.dart';
import 'package:camera_app/domain/usecases/getphotos/get_photos_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetPhotosUseCaseImpl implements GetPhotosUseCase {
  final PhotoRepository _repository;

  GetPhotosUseCaseImpl(this._repository);

  @override
  Future<List<Photo>> execute() async {
    return await _repository.getPhotos();
  }
}
