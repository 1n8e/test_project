import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/check/check_bloc.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/ui/widgets/check_screen/check_card.dart';

class CheckList extends StatelessWidget {
  const CheckList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CheckBloc()..add(GetCheckEvent()),
        child: BlocBuilder<CheckBloc, CheckState>(
          builder: (context, state) {
            if (state is CheckLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CheckFailure) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is CheckSuccess) {
              debugPrint("${state.todo[1].completed}");
              debugPrint(state.todo[1].title);
              return ListView.separated(
                padding: ConstPadding.todosScreenPadding,
                itemCount: state.todo.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return CheckCard(
                    todo: state.todo[index],
                  );
                },
              );
            } else {
              return Offstage();
            }
          },
        ));
  }
}
