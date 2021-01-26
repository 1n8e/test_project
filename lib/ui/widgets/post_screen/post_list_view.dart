import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/post/posts_bloc.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/ui/screens/detailed_post_screen.dart';
import 'package:test_project/ui/widgets/post_screen/post_card.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostsBloc()..add(GetPostsEvent()),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          print(state);
          if (state is PostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFailure) {
            return Center(
              child: Text(
                'Ошибка',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is PostSuccess) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return FlatButton(
                  padding: ConstPadding.cardPadding,
                  child: PostCard(posts: state.posts[index]),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailedPostScreen(post: state.posts[index]),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 10),
            );
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
