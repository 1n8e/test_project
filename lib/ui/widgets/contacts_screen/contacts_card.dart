import 'package:flutter/material.dart';
import 'package:test_project/models/contacts_model.dart';

class ContactsCard extends StatelessWidget {
  final Contacts contacts;
  const ContactsCard({Key key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white70,
          ),
          SizedBox(width: 15),
          Text(
            contacts.name,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
