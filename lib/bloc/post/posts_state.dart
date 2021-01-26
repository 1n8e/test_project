part of 'posts_bloc.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostLoading extends PostsState {}

class PostSuccess extends PostsState {
  final List<Post> posts;

  PostSuccess(this.posts);
}

class PostFailure extends PostsState {
  final String error;

  PostFailure(this.error);
}
