import 'package:bloc_example/domain/bloc/home_bloc.dart';
import 'package:bloc_example/domain/bloc/home_bloc_events.dart';
import 'package:bloc_example/domain/bloc/home_bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = context.read<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bloc example'),
      ),
      body: BlocConsumer<HomeBloc, HomeStates>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Изначальное состояния'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      homeBloc.add(ButtonTapEvent());
                    },
                    child: const Text('Нажми чтобы вызвать состояние загрузки'),
                  )
                ],
              ),
            );
          }
          if (state is HomeLoadingState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Состояние загрузи'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            );
          }
          if (state is HomeLoadedState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Загрузка завершена'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      homeBloc.add(ButtonTapEvent());
                    },
                    child: const Text('Повторить загрузку'),
                  )
                ],
              ),
            );
          }
          if (state is HomeErrorState) {
            return const Center(
              child: Text('Произошл ошибка'),
            );
          }

          return Container();
        },
        listener: (context, state) {
          if (state is HomeLoadingState) {}
        },
      ),
    );
  }
}
