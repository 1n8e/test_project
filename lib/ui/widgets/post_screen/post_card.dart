import 'package:flutter/material.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post posts;
  const PostCard({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.contentCardPadding,
      width: double.maxFinite,
      height: 95,
      decoration: BoxDecoration(
        color: ConstColor.customCardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            posts.title,
            style: ConstTextStyles.titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Text(
            posts.body,
            style: ConstTextStyles.bodyPostTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
