part of 'comments_bloc.dart';

abstract class CommentsEvent {}

class GetCommentEvent extends CommentsEvent {
  final int postId;

  GetCommentEvent(this.postId);
}
