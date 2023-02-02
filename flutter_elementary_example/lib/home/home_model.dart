import 'package:elementary/elementary.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_events.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';
import 'package:flutter_elementary_example/home/home_wm.dart';

class HomeModel extends ElementaryModel {
  HomeModel(this._homeBloc);
  final HomeBloc _homeBloc;

  Stream<HomeStates> get homeBlocStream => _homeBloc.stream;

  void buttonTap() {
    _homeBloc.add(HomeBlocButtonTapEvent());
  }

  Future<void> saveTodoModel(TodoModel todo) async {}
}
