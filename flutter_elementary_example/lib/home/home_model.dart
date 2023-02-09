import 'package:elementary/elementary.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_events.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';

class HomeModel extends ElementaryModel {
  HomeModel(this._homeBloc);
  final TodoBloc _homeBloc;

  Stream<TodoBlocStates> get homeBlocStream => _homeBloc.stream;

  void deleteTodo(int index) {
    _homeBloc.add(TodoBlocDeleteEvent(index));
  }
}
