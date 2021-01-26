part of 'album_bloc.dart';

abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumSuccess extends AlbumState {
  final List<Album> albums;

  AlbumSuccess(this.albums);
}

class AlbumFailure extends AlbumState {
  final String error;

  AlbumFailure(this.error);
}
