import 'package:flutter/material.dart';
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
  List<Contact> selectedContacts = [];

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
          final isSelected = selectedContacts.contains(contact);
          return ListTile(
            title: Text('${contact.firstName} ${contact.lastName}'),
            subtitle: Text(contact.phoneNumber),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _onContactSelect(contact),
                  icon: isSelected
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank),
                ),
                CircleAvatar(
                  backgroundImage: FileImage(File(contact.avatarPath)),
                ),
              ],
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _onContactTap(contact),
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
          child: AddContactButton(
            onPressed: _onAddContactPressed,
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
    });
  }

  void _onContactTap(Contact contact) {
    // Handle contact tap event
  }

  void _onContactSelect(Contact contact) {
    setState(() {
      if (selectedContacts.contains(contact)) {
        selectedContacts.remove(contact);
      } else {
        selectedContacts.add(contact);
      }
    });
  }
}
