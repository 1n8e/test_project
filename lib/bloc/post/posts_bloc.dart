import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_project/data/data_post/post_data.dart';
import 'package:test_project/models/post_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsDataSource postDataSource = PostsDataSource();
  PostsBloc() : super(PostsInitial());

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is GetPostsEvent) {
      yield PostLoading();
      try {
        List<Post> posts = await postDataSource.getPosts();
        yield PostSuccess(posts);
      } on Exception catch (e) {
        yield PostFailure(e.toString());
      }
    }
  }
}
