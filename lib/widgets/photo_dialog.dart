import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoDialog extends StatefulWidget {
  final VoidCallback? onGallerySelected;
  final VoidCallback? onCameraSelected;

  const PhotoDialog({
    Key? key,
    this.onGallerySelected,
    this.onCameraSelected,
  }) : super(key: key);

  @override
  _PhotoDialogState createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> {
  @override
  void initState() {
    super.initState();
    _requestGalleryPermission();
  }

  void _requestGalleryPermission() async {
    PermissionStatus status = await Permission.photos.request();
    if (status.isDenied) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text('Please grant access to the gallery in the app settings.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text('App Settings'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Photo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from Gallery'),
            onTap: widget.onGallerySelected,
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Take a Photo'),
            onTap: widget.onCameraSelected,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
