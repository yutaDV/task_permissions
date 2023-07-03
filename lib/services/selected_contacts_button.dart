import 'package:flutter/material.dart';
import '/services/selected_contacts_provider.dart';

class SelectedContactsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedContactsProvider = SelectedContactsProvider.of(context);
    final selectedContactsCount = selectedContactsProvider.selectedContacts.length;

    return FloatingActionButton(
      onPressed: () {
        // Handle button tap event
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.check),
          Text(
            selectedContactsCount.toString(),
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
