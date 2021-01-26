part of 'photo_bloc.dart';

abstract class PhotoEvent {}

class GetPhotoEvent extends PhotoEvent {
  final int albumId;

  GetPhotoEvent(this.albumId);
}
