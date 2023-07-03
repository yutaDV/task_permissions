import 'package:flutter/material.dart';
import '/models/contact.dart';

class SelectedContactsProvider extends InheritedWidget {
  final List<Contact> selectedContacts;
  final ValueChanged<Contact> toggleContact;

  SelectedContactsProvider({
    Key? key,
    required this.selectedContacts,
    required this.toggleContact,
    required Widget child,
  }) : super(key: key, child: child);

  static SelectedContactsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SelectedContactsProvider>()!;
  }

  bool isSelected(Contact contact) {
    return selectedContacts.contains(contact);
  }

  @override
  bool updateShouldNotify(SelectedContactsProvider oldWidget) {
    return selectedContacts != oldWidget.selectedContacts;
  }
}
