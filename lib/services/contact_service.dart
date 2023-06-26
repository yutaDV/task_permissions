import 'package:flutter/material.dart';
import '/models/contact.dart';

class ContactService {
  static void saveContact(
      String lastName,
      String firstName,
      String phoneNumber,
      String avatarPath,
      BuildContext context,
      ) {
    final newContact = Contact(
      lastName: lastName,
      firstName: firstName,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );

    // Збереження контакту
    ContactRepository.saveContact(newContact);

    // Відображення діалогового вікна з повідомленням про збереження контакту
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Saved'),
        content: const Text('The contact has been saved.'),
        actions: [
          TextButton(
            onPressed: () {
              // Повернення до домашнього екрану
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
