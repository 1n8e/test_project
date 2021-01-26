import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/comment/comments_bloc.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/models/post_model.dart';
import 'package:test_project/ui/widgets/custom_appbar.dart';
import 'package:test_project/ui/widgets/post_screen/comments_card.dart';

class MoreCommentsScreen extends StatelessWidget {
  final Post post;
  final barHeight = 56;
  const MoreCommentsScreen({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (_) => CommentsBloc()
        ..add(
          GetCommentEvent(post.id),
        ),
      child: Scaffold(
        backgroundColor: ConstColor.customBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, statusBarHeight + barHeight),
          child: CustomAppBar(
            screenTitle: post.title,
          ),
        ),
        body: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state is CommentsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CommentsFailure) {
              return Center(
                child: Text("Ошибка"),
              );
            } else if (state is CommentsSuccess) {
              return ListView.separated(
                padding: ConstPadding.cardPadding,
                itemCount: state.comment.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return CommentsCard(
                    comments: state.comment[index],
                  );
                },
              );
            } else {
              return Offstage();
            }
          },
        ),
      ),
    );
  }
}
