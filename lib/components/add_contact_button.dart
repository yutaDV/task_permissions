import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '/screens/create_contact_screen.dart';

class AddContactButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddContactButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        PermissionStatus status = await Permission.contacts.status;
        if (status.isDenied) {
          _showAccessDeniedDialog(context);
        } else if (status.isGranted) {
          onPressed();
        }
      },
      child: const Icon(Icons.add),
    );
  }

  void _showAccessDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Access Denied'),
        content: const Text('Please grant permission to access contacts.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
