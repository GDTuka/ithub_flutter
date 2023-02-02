import 'package:bloc_example/domain/bloc/home_bloc_events.dart';
import 'package:bloc_example/domain/bloc/home_bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(HomeInitialState()) {
    on<ButtonTapEvent>(_buttonTap);
  }

  Future<void> _buttonTap(ButtonTapEvent event, Emitter emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(HomeLoadedState());
  }
}
