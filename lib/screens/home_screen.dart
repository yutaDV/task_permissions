import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '/services/lottie_animation_start.dart';
import '/components/add_contact_button.dart';
import '/screens/create_contact_screen.dart';
import '/models/contact.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = ContactRepository.getContacts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        centerTitle: true,
      ),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    if (contacts.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LottieAnimationCall(),
          const SizedBox(height: 16),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text('${contact.firstName} ${contact.lastName}'),
            subtitle: Text(contact.phoneNumber),
            leading: CircleAvatar(
              backgroundImage: FileImage(File(contact.avatarPath)),
            ),
          );
        },
      );
    }
  }

  Widget _buildFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () async {
              PermissionStatus status = await Permission.contacts.status;
              if (status.isDenied) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Access Denied'),
                    content: const Text(
                        'Please grant permission to access contacts.'),
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
              } else if (status.isGranted) {
                _navigateToCreateContactScreen(context);
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () => _navigateToCreateContactScreen(context),
            child: const Icon(Icons.create),
          ),
        ),
      ],
    );
  }

  void _navigateToCreateContactScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateContactScreen()),
    );

    setState(() {
      contacts = ContactRepository.getContacts();
    });
  }
}
