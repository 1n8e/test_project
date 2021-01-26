import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_project/data/album_and_photo_data/album_and_photo_data.dart';
import 'package:test_project/models/photo_model.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial());
  AlbumAndPhotoDataSource albumAndPhotoDataSource = AlbumAndPhotoDataSource();
  List<Photo> photos;

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is GetPhotoEvent) {
      yield PhotoLoading();
      try {
        photos = await albumAndPhotoDataSource.getPhotos(event.albumId);
        yield PhotoSuccess(photos);
      } catch (e) {
        yield PhotoFailure(e.toString());
      }
    }
  }
}
