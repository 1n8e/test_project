import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/comment/comments_bloc.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/post_model.dart';
import 'package:test_project/ui/screens/more_comments_screen.dart';
import 'package:test_project/ui/widgets/custom_appbar.dart';
import 'package:test_project/ui/widgets/post_screen/comments_card.dart';

class DetailedPostScreen extends StatelessWidget {
  final Post post;
  final double barHeight = 56;
  const DetailedPostScreen({Key key, this.post}) : super(key: key);

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
        body: Column(
          children: [
            Container(
              padding: ConstPadding.detailedPostPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    post.title,
                    style: ConstTextStyles.titleStyle,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    post.body,
                    style: ConstTextStyles.bodyPostTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Expanded(
              child: BlocBuilder<CommentsBloc, CommentsState>(
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
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: ConstPadding.cardPadding,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CommentsCard(
                                    comments: state.comment[index],
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 64,
                              decoration: BoxDecoration(
                                color: ConstColor.customFlatButtonColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MoreCommentsScreen(
                                        post: post,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      ConstPadding.moreCommentButtonPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Show me  ',
                                            style:
                                                ConstTextStyles.showTextStyle,
                                          ),
                                          Text(
                                            '${state.comment.last.id} results',
                                            style: ConstTextStyles
                                                .resultsTextStyle,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    );
                  } else {
                    return Offstage();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
