import 'package:camera_app/domain/entities/photo.dart';
import 'package:flutter/material.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "No Photos Added Yet.",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));
  }
}
