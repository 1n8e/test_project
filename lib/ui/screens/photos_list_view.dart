import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/photo/photo_bloc.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/album_model.dart';
import 'package:test_project/ui/widgets/album_screen/full_photo.dart';
import 'package:test_project/ui/widgets/custom_appbar.dart';

class PhotosListView extends StatelessWidget {
  final Album album;
  final double barHeight = 56;
  const PhotosListView({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PhotoBloc()..add(GetPhotoEvent(album.id)),
        child: Scaffold(
            backgroundColor: ConstColor.customBackgroundColor,
            appBar: PreferredSize(
              preferredSize: Size(double.maxFinite, barHeight),
              child: CustomAppBar(
                screenTitle: album.title,
              ),
            ),
            body: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                if (state is PhotoLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PhotoFailure) {
                  return Text(state.error);
                } else if (state is PhotoSuccess) {
                  return GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6),
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => FullPhoto(
                                photos: state.photos[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: CustomLinearGradient
                                  .customPhotoCardLinearGradient),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    child: Image.network(
                                        state.photos[index].thumbnailUrl),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  state.photos[index].title,
                                  style: ConstTextStyles.photoTitleTextStyle,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Offstage();
                }
              },
            )));
  }
}
