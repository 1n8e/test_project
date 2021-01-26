import 'package:flutter/material.dart';
import 'package:test_project/models/photo_model.dart';

class FullPhoto extends StatelessWidget {
  final Photo photos;
  const FullPhoto({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(child: Image.network(photos.url)));
  }
}
