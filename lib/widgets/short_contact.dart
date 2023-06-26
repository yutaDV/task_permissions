import 'package:flutter/material.dart';

class ShortContact extends StatelessWidget {
  /// наразі не використовується попрактикувати щоб список відображав віджети контактуfinal String contactName;
  final String contactPhoneNumber;

  ShortContact({
    required this.contactName,
    required this.contactPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contactName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            contactPhoneNumber,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
