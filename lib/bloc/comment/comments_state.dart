part of 'comments_bloc.dart';

abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsFailure extends CommentsState {
  final String error;

  CommentsFailure(this.error);
}

class CommentsSuccess extends CommentsState {
  final List<Comment> comment;

  CommentsSuccess(this.comment);
}
