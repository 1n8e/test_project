import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_project/data/album_and_photo_data/album_and_photo_data.dart';
import 'package:test_project/models/album_model.dart';
import 'package:test_project/models/photo_model.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  List<Album> albums;
  List<Photo> photos;
  AlbumBloc() : super(AlbumInitial());

  final AlbumAndPhotoDataSource _albumAndPhotoDataSource =
      AlbumAndPhotoDataSource();

  @override
  Stream<AlbumState> mapEventToState(
    AlbumEvent event,
  ) async* {
    if (event is GetAlbumsEvent) {
      yield AlbumLoading();
      try {
        albums = await _albumAndPhotoDataSource.getAlbums();

        for (final Album album in albums) {
          photos = await _albumAndPhotoDataSource.getPhotos(album.id);

          album.images = photos;
        }

        yield AlbumSuccess(albums);
      } catch (e) {
        yield AlbumFailure(e.toString());
      }
    }
  }
}
