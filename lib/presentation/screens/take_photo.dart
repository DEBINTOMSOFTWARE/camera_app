import 'package:camera/camera.dart';
import 'package:camera_app/presentation/screens/display_picture.dart';
import 'package:camera_app/presentation/widgets/camera_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/presentation/components/ca_text.dart';

class TakePhotoScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final VoidCallback onPhotoSaved;

  const TakePhotoScreen(
      {Key? key, required this.cameras, required this.onPhotoSaved})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OpenCameraState();
  }
}

class _OpenCameraState extends State<TakePhotoScreen> {
  late CameraController controller;
  late Future<void> cameraInit;

  Future<void> getCameras() async {
    try {
      controller = CameraController(widget.cameras[0], ResolutionPreset.medium,
          enableAudio: false);
      cameraInit = controller.initialize();
    } catch (e) {
      print("Error initializing camera's $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getCameras();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      final XFile file = await controller.takePicture();
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: file.path,
            onPhotoSaved: widget.onPhotoSaved,
          ),
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CAText(
        'Take Photo',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      )),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: cameraInit,
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                return CameraPreview(controller);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const CameraOverlay()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
