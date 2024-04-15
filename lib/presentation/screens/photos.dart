import 'package:camera_app/core/presentation/components/ca_text.dart';
import 'package:camera_app/presentation/screens/take_photo.dart';
import 'package:camera_app/presentation/widgets/photos_list.dart';
import 'package:camera_app/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera_app/domain/entities/photo.dart';
import 'package:camera/camera.dart';

class PhotosScreen extends ConsumerStatefulWidget {
  final List<CameraDescription> cameras;

  const PhotosScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  ConsumerState<PhotosScreen> createState() {
    return _PhotosScreenState();
  }
}

class _PhotosScreenState extends ConsumerState<PhotosScreen> {
  late Future<List<Photo>> _photosFuture;

  @override
  void initState() {
    super.initState();
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    _photosFuture = ref.read(getPhotosUseCaseProvider).execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CAText(
            'Your Photos',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TakePhotoScreen(
                            cameras: widget.cameras,
                            onPhotoSaved: () {
                              setState(() {
                                _fetchPhotos();
                              });
                            },
                          )));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: _photosFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : PhotosList(photos: snapshot.requireData),
        ));
  }
}
