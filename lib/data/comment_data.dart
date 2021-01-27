import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/models/comment_model.dart';

class CommentsDataSource {
  String url = "https://jsonplaceholder.typicode.com/comments?postId=";

  Future<List<Comment>> getComments(int postId) async {
    Response response = await get(url + postId.toString());

    return (jsonDecode(response.body) as List)
        .map((element) => Comment.fromJson(element))
        .toList();
  }
}
