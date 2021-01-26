part of 'check_bloc.dart';

abstract class CheckState {}

class CheckInitial extends CheckState {}

class CheckLoading extends CheckState {}

class CheckSuccess extends CheckState {
  final List<Todo> todo;

  CheckSuccess(this.todo);
}

class CheckFailure extends CheckState {
  final String error;

  CheckFailure(this.error);
}
