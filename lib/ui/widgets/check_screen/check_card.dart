import 'package:flutter/material.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/check_model.dart';

class CheckCard extends StatelessWidget {
  final Todo todo;
  CheckCard({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: todo.completed
              ? (Color(0xff6C63FF).withOpacity(0.24))
              : (Colors.transparent)),
      width: 328,
      height: 52,
      child: Row(
        children: [
          Checkbox(
            activeColor: Color(0xff6C63FF),
            checkColor: Color(0xff0F0B21),
            onChanged: (value) {},
            value: todo.completed,
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 250,
            child: Text(
              todo.title,
              style: todo.completed
                  ? (ConstTextStyles.todoActiveTitleTextStyle)
                  : (ConstTextStyles.todoUnActiveTitleTextStyle),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
