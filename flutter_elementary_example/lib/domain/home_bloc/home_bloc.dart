import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_events.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeStates> {
  HomeBloc() : super(HomeLoadedState()) {
    on<HomeBlocButtonTapEvent>(_buttonTap);
  }

  Future<void> _buttonTap(HomeBlocButtonTapEvent event, Emitter emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(HomeLoadedState());
  }
}
