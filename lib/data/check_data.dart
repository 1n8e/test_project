import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/models/check_model.dart';

class CheckDataSource {
  final String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo>> getCheck() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Todo.fromJson(element))
        .toList();
  }
}
