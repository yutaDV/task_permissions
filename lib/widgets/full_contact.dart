import 'package:flutter/material.dart';


/// наразі не використовується попрактикувати щоб список відображав віджети контакту
class FullContact extends StatelessWidget {
  final String contactName;
  final String contactPhoneNumber;
  final String contactAvatarPath;

  FullContact({
    required this.contactName,
    required this.contactPhoneNumber,
    required this.contactAvatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(contactAvatarPath),
          ),
          SizedBox(height: 16.0),
          Text(
            contactName,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            contactPhoneNumber,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
