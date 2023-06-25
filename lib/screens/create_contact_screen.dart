import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '/widgets/photo_dialog.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  _CreateContactScreenState createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  ImagePicker _imagePicker = ImagePicker();
  PickedFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last name',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First name',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Логіка для збереження контакту
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: _showImageSourceDialog,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey,
        child: _pickedImage != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.file(
            File(_pickedImage!.path),
            fit: BoxFit.cover,
            width: 160,
            height: 160,
          ),
        )
            : const Icon(
          Icons.add,
          size: 48,
        ),
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => PhotoDialog(
        onGallerySelected: () {
          _getImage(ImageSource.gallery);
          Navigator.pop(context);
        },
        onCameraSelected: () {
          _getImage(ImageSource.camera);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _getImage(ImageSource source) async {
    final pickedImage = await _imagePicker.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }
}
