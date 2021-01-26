import 'package:flutter/material.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/comment_model.dart';

class CommentsCard extends StatelessWidget {
  final Comment comments;
  const CommentsCard({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.contentCardPadding,
      height: 165,
      decoration: BoxDecoration(
          color: ConstColor.customCardColor,
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[600],
                child: Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 200,
                child: Text(
                  comments.name,
                  overflow: TextOverflow.ellipsis,
                  style: ConstTextStyles.commentUsernameTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            comments.body,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: ConstTextStyles.commentBodyTextStyle,
          ),
        ],
      ),
    );
  }
}
