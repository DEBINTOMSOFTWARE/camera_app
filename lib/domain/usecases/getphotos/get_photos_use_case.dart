import 'package:camera_app/domain/entities/photo.dart';

abstract class GetPhotosUseCase {
  Future<List<Photo>> execute();
}
