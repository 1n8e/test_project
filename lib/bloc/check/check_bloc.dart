import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_project/data/check_data.dart';
import 'package:test_project/models/check_model.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckInitial());
  CheckDataSource checkDataSource = CheckDataSource();
  List<Todo> todo;

  @override
  Stream<CheckState> mapEventToState(
    CheckEvent event,
  ) async* {
    if (event is GetCheckEvent) {
      yield CheckLoading();
      try {
        todo = await checkDataSource.getCheck();
        yield CheckSuccess(todo);
      } catch (e) {
        yield CheckFailure(e.toString());
      }
    }
  }
}
