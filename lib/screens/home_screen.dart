import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '/services/lottie_animation_start.dart';
import '/components/add_contact_button.dart';
import '/screens/create_contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> contacts = []; // порожній список контактів

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
        centerTitle: true,
      ),
      body: _buildBody(contacts, context),
    );
  }

  Widget _buildBody(List<String> contacts, BuildContext context) {
    if (contacts.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LottieAnimationCall(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactButton(
                key: UniqueKey(),
                buttonText: 'Add Contact',
                onPressed: () async {
                  // Перевірка дозволу на доступ до контактів
                  PermissionStatus status = await Permission.contacts.status;
                  if (status.isDenied) {
                    print(status.isDenied);
                    // Дозвіл на доступ до контактів не надано, показати повідомлення
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Access Denied'),
                        content: const Text('Please grant permission to access contacts.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Відкрити налаштування дозволу
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
                    //  додавання контакту
                    _addContact();
                  }
                },
              ),
              const SizedBox(width: 16),
              ContactButton(
                key: UniqueKey(),
                buttonText: 'Create Contact',
                onPressed: () => _navigateToCreateContactScreen(context),
              ),
            ],
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact),
            // Додаткова інформація про контакт
          );
        },
      );
    }
  }

  Future<void> _addContact() async {
    // TODO: Додайте код для додавання контакту
  }

  void _navigateToCreateContactScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateContactScreen()),
    );
  }
}
