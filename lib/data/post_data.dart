import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/models/post_model.dart';

class PostsDataSource {
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Post.fromJson(element))
        .toList();
  }
}
