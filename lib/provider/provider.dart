import 'package:camera_app/data/datasources/photos_datasource.dart';
import 'package:camera_app/data/datasources/photos_datasource_impl.dart';
import 'package:camera_app/data/repositories/photo_repository_impl.dart';
import 'package:camera_app/data/repositories/photo_respository.dart';
import 'package:camera_app/domain/usecases/getphotos/get_photos_use_case.dart';
import 'package:camera_app/domain/usecases/getphotos/get_photos_usecase_impl.dart';
import 'package:camera_app/domain/usecases/insertphoto/insert_photo_usecase.dart';
import 'package:camera_app/domain/usecases/insertphoto/insert_photo_usecase_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera_app/data/db/database_helper.dart';

final photosDataSourceProvider = Provider<PhotosDataSource>((ref) {
  final databaseHelper = DatabaseHelper();
  return PhotosDataSourceImpl(databaseHelper);
});

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  final dataSource = ref.read(photosDataSourceProvider);
  return PhotoRepositoryImpl(dataSource);
});

final insertPhotoUseCaseProvider = Provider<InsertPhotoUseCase>((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return InsertPhotoUseCaseImpl(repository);
});

final getPhotosUseCaseProvider = Provider<GetPhotosUseCase>((ref) {
  final repository = ref.watch(photoRepositoryProvider);
  return GetPhotosUseCaseImpl(repository);
});
