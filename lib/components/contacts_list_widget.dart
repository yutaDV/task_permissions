import 'package:flutter/material.dart';
import '/models/contact.dart';

class ContactsListWidget extends StatelessWidget {
  final List<Contact> contacts;
  final List<bool> selectedContacts;
  final Function(int, bool) onContactSelected;

  const ContactsListWidget({
    required this.contacts,
    required this.selectedContacts,
    required this.onContactSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];

        return ListTile(
          title: Text(contact.firstName),
          subtitle: Text(contact.lastName),
          leading: Checkbox(
            value: selectedContacts[index],
            onChanged: (value) {
              onContactSelected(index, value ?? false);
            },
          ),
        );
      },
    );
  }
}
