import 'package:flutter/material.dart';

class Contact {
  final String lastName;
  final String firstName;
  final String phoneNumber;
  final String avatarPath;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
    required this.avatarPath,
  });
}

class ContactRepository {
  static List<Contact> _contacts = [];

  static void saveContact(Contact contact) {
    _contacts.add(contact);
  }

  static List<Contact> getContacts() {
    return _contacts;
  }
}
