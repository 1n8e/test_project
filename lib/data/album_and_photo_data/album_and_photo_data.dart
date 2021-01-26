import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/models/album_model.dart';
import 'package:test_project/models/photo_model.dart';

class AlbumAndPhotoDataSource {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Album>> getAlbums() async {
    Response response =
        await get("https://jsonplaceholder.typicode.com/albums");
    return (jsonDecode(response.body) as List)
        .map((element) => Album.fromJson(element))
        .toList();
  }

  Future<List<Photo>> getPhotos(int albumId) async {
    Response response = await get(
        "https://jsonplaceholder.typicode.com/photos?albumId=" +
            albumId.toString());

    return (jsonDecode(response.body) as List)
        .map((element) => Photo.fromJson(element))
        .toList();
  }
}
