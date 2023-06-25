import 'package:flutter/material.dart';
import '/services/lottie_animation_start.dart';
import '/components/add_contact_button.dart';

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
      body: _buildBody(contacts),
    );
  }

  Widget _buildBody(List<String> contacts) {
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
                onPressed: () {
                  // Логіка для додавання контакту
                },
              ),
              const SizedBox(width: 16),
              ContactButton(
                key: UniqueKey(),
                buttonText: 'Create Contact',
                onPressed: () {
                  // Логіка для створення контакту
                },
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
}
