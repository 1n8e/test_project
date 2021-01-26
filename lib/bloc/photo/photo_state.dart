part of 'photo_bloc.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccess extends PhotoState {
  final List<Photo> photos;

  PhotoSuccess(this.photos);
}

class PhotoFailure extends PhotoState {
  final String error;

  PhotoFailure(this.error);
}
