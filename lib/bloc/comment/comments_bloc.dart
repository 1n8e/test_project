import 'dart:async';

import 'package:bloc/bloc.dart';
import 'file:///C:/Users/natem/dev/test_project/lib/data/comment_data.dart';
import 'package:test_project/models/comment_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial());
  List<Comment> comments;
  CommentsDataSource commentsDataSource = CommentsDataSource();

  @override
  Stream<CommentsState> mapEventToState(
    CommentsEvent event,
  ) async* {
    if (event is GetCommentEvent) {
      yield CommentsLoading();
      try {
        comments = await commentsDataSource.getComments(event.postId);
        yield CommentsSuccess(comments);
      } catch (e) {
        yield CommentsFailure(e.toString());
      }
    }
  }
}
