import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_elementary_example/data/source/todo_local_ds.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';
import 'package:flutter_elementary_example/domain/todo_repository/todo_repository.dart';
import 'package:flutter_elementary_example/home/home_model.dart';
import 'package:flutter_elementary_example/home/home_view.dart';

abstract class IHomeWidgetModel extends IWidgetModel {
  ListenableState<EntityState<String>> get mainScreeenListenable;

  TextEditingController get controller;

  void deleteTodo(int index);
}

HomeWidgetModel homeWidgetModelFactory(BuildContext context) {
  return HomeWidgetModel(
    HomeModel(
      TodoBloc(
        TodoRepository(
          TodoLocalDS(),
        ),
      ),
    ),
  );
}

class HomeWidgetModel extends WidgetModel<HomeScreenWidget, HomeModel> implements IHomeWidgetModel {
  HomeWidgetModel(HomeModel model) : super(model);

  final _mainScreenEntity = EntityStateNotifier<String>();

  late final StreamSubscription<TodoBlocStates> _homeBlocStreamSubcription;

  @override
  void initWidgetModel() {
    _mainScreenEntity.content('Hello elementary World');

    _homeBlocStreamSubcription = model.homeBlocStream.listen(_updateStates);

    super.initWidgetModel();
  }

  void _updateStates(TodoBlocStates state) {
    if (state is TodoBlocDeletedState) {
      //* Удаляем объект из списка который на экране
      print('4312');
    }
    if (state is TodoBlocDeletingErrorState) {
      //* Показываем пользователю, что есть ошибка при удалении объекта, способом который понравится
      print('1234');
      _mainScreenEntity.error();
    }
    if (state is TodoBlocLoadingState) {
      print('Loading');
    }
  }

  @override
  ListenableState<EntityState<String>> get mainScreeenListenable => _mainScreenEntity;

  @override
  void dispose() {
    _homeBlocStreamSubcription.cancel();
    super.dispose();
  }

  @override
  void deleteTodo(int index) {
    model.deleteTodo(index);
  }

  final _contoller = TextEditingController();

  @override
  TextEditingController get controller => _contoller;
}
