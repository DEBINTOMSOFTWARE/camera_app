import 'package:camera_app/domain/entities/photo.dart';
import 'package:flutter/material.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) {
      return Center(
          child: Text(
        "No Photos Added Yet.",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ));
    }
    return GridView.builder(
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              photo.title,
              textAlign: TextAlign.center,
            ),
          ),
          child: Image(
            image: FileImage(photo.image),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
