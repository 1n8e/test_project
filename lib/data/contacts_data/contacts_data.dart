import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/models/contacts_model.dart';

class ContactsDataSource {
  final String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Contacts>> getContacts() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Contacts.fromJson(element))
        .toList();
  }
}
