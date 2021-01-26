import 'package:test_project/models/photo_model.dart';

class Album {
  final int id;
  final String title;
  List<Photo> images;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
