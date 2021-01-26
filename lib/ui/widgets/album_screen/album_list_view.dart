import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/album/album_bloc.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/text_styles.dart';
import 'package:test_project/models/album_model.dart';
import 'package:test_project/models/photo_model.dart';
import 'package:test_project/ui/screens/photos_list_view.dart';

class AlbumListView extends StatelessWidget {
  final Album album;
  final Photo photo;
  AlbumListView({Key key, this.album, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc()..add(GetAlbumsEvent()),
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumFailure) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is AlbumSuccess) {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PhotosListView(
                                  album: state.albums[index],
                                )));
                  },
                  child: Container(
                      width: 160,
                      height: 168,
                      decoration: BoxDecoration(
                        gradient:
                            CustomLinearGradient.customPhotoCardLinearGradient,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                state.albums[index].images.first.thumbnailUrl,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              state.albums[index].title,
                              style: ConstTextStyles.albumTitleTextStyle,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )),
                );
              },
            );
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
