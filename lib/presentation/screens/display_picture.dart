import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/presentation/components/ca_text.dart';
import '../../provider/provider.dart';

class DisplayPictureScreen extends ConsumerStatefulWidget {
  final String imagePath;
  final VoidCallback onPhotoSaved;

  const DisplayPictureScreen(
      {Key? key, required this.imagePath, required this.onPhotoSaved})
      : super(key: key);

  @override
  ConsumerState<DisplayPictureScreen> createState() {
    return _DisplayPictureScreen();
  }
}

class _DisplayPictureScreen extends ConsumerState<DisplayPictureScreen> {
  final _titleController = TextEditingController();

  void _savePhoto() async {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CAText(
          'Please enter the title',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        duration: const Duration(seconds: 2), // Set the duration
      ));
    } else if (widget.imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CAText(
          'Please take an image',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        duration: const Duration(seconds: 2), // Set the duration
      ));
    } else {
      await ref
          .read(insertPhotoUseCaseProvider)
          .execute(enteredTitle, File(widget.imagePath));
      widget.onPhotoSaved();
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CAText(
          'Display Picture',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3))),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  _savePhoto();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Photo'))
          ],
        ),
      ),
    );
  }
}
