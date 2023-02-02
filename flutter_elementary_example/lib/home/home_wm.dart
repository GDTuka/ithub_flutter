import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';
import 'package:flutter_elementary_example/home/home_model.dart';
import 'package:flutter_elementary_example/home/home_view.dart';

abstract class IHomeWidgetModel extends IWidgetModel {
  ListenableState<EntityState<String>> get mainScreeenListenable;
  ListenableState<EntityState<TodoModel>> get totoModelListenable;

  TextEditingController get controller;

  void buttonTap();
}

HomeWidgetModel homeWidgetModelFactory(BuildContext context) {
  return HomeWidgetModel(
    HomeModel(
      HomeBloc(),
    ),
  );
}

class TodoModel {
  TodoModel(this.id);
  int id;
}

class HomeWidgetModel extends WidgetModel<HomeScreenWidget, HomeModel> implements IHomeWidgetModel {
  HomeWidgetModel(HomeModel model) : super(model);

  final _mainScreenEntity = EntityStateNotifier<String>();

  late final StreamSubscription<HomeStates> _homeBlocStreamSubcription;

  @override
  void initWidgetModel() {
    _mainScreenEntity.content('Hello elementary World');

    _homeBlocStreamSubcription = model.homeBlocStream.listen(_updateStates);

    super.initWidgetModel();
  }

  void _updateStates(HomeStates state) {
    if (state is HomeLoadingState) {
      _mainScreenEntity.loading();
    }
    if (state is HomeLoadedState) {
      _mainScreenEntity.content('Loaded');
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
  void buttonTap() {
    model.buttonTap();

    if (_todoModelEntity.value == null) return;
    if (_todoModelEntity.value!.data == null) return;

    model.saveTodoModel(_todoModelEntity.value!.data!);
  }

  final _todoModelEntity = EntityStateNotifier<TodoModel>();

  @override
  ListenableState<EntityState<TodoModel>> get totoModelListenable => _todoModelEntity;

  final _contoller = TextEditingController();

  @override
  TextEditingController get controller => _contoller;
}
