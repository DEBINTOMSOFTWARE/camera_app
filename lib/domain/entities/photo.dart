import 'dart:io';

class Photo {
  Photo({
    required this.id,
    required this.title,
    required this.image,
  });

  final String id;
  final String title;
  final File image;
}
