import 'package:camera_app/presentation/widgets/image_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddPhotoScreen extends StatefulWidget {

  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePhoto() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Photo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            const SizedBox(height: 16,),
            ImageInput(onPickedImage: (image) {
              _selectedImage = image;
            }),
            const SizedBox(height: 16,),
            ElevatedButton.icon(
                onPressed: _savePhoto, 
                icon: const Icon(Icons.add), 
                label: const Text('Add Place'))
          ],
        ),
      ),
    );
  }

}