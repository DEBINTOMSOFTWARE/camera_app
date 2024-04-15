import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PhotoData {
  PhotoData({String? id, required this.title, required this.image})
      : id = id ?? uuid.v4();

  final String id;
  final String title;
  final File image;
}
