import 'package:camera_app/presentation/screens/add_photo.dart';
import 'package:camera_app/presentation/widgets/photos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Photos'),
          actions: [IconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddPhotoScreen())
            );
          }, icon: const Icon(Icons.add))],
        ),
        body: const PhotosList(photos: [],));
  }
}
