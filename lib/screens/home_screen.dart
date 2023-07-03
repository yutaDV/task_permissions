import 'package:flutter/material.dart';
import '/services/lottie_animation_start.dart';
import '/components/add_contact_button.dart';
import '/screens/create_contact_screen.dart';
import '/models/contact.dart';
import '/components/contacts_list_widget.dart';
import '/services/selected_contacts_provider.dart';
import '/services/selected_contacts_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = ContactRepository.getContacts();
  List<bool> selectedContacts = List.filled(ContactRepository.getContacts().length, false);

  @override
  Widget build(BuildContext context) {
    return SelectedContactsProvider(
      selectedContacts: contacts,
      toggleContact: _toggleContact,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Contacts'),
          centerTitle: true,
        ),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
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
      return ContactsListWidget(
        contacts: contacts,
        selectedContacts: selectedContacts,
        onContactSelected: (int index, bool value) {
          _onContactSelect(contacts[index]);
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
          child: AddContactButton(
            onPressed: _onAddContactPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectedContactsButton(),
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

  void _onAddContactPressed() {
    _navigateToCreateContactScreen(context);
  }

  void _navigateToCreateContactScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateContactScreen()),
    );

    setState(() {
      contacts = ContactRepository.getContacts();
      selectedContacts = List.filled(contacts.length, false);
    });
  }

  void _onContactSelect(Contact contact) {
    setState(() {
      // Toggle contact selection
    });
  }

  void _toggleContact(Contact contact) {
    final index = contacts.indexOf(contact);
    if (index >= 0 && index < selectedContacts.length) {
      setState(() {
        selectedContacts[index] = !selectedContacts[index];
      });
    }
  }
}
