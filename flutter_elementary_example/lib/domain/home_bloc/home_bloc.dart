import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_events.dart';
import 'package:flutter_elementary_example/domain/home_bloc/home_bloc_state.dart';
import 'package:flutter_elementary_example/domain/todo_repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocStates> {
  TodoBloc(
    this._todoRepository,
  ) : super(TodoBlocInitialState()) {
    on<TodoBlocDeleteEvent>(_deleteTodo);
    on<TodoBlocAddTodoEvent>(_addTodo);
    on<TodoBlocCompleteTodoEvent>(_completeTodo);
    on<TodoBlocLoadTodoEvent>(_loadTodo);
  }

  final TodoRepository _todoRepository;

  Future<void> _deleteTodo(TodoBlocDeleteEvent event, Emitter emit) async {
    emit(TodoBlocLoadingState());

    //* Типо долго удаляется
    await Future.delayed(const Duration(seconds: 2));

    bool res = await _todoRepository.deleteTodo(event.index);

    if (res) {
      emit(TodoBlocDeletedState());
      return;
    }
    emit(TodoBlocDeletingErrorState());
  }

  Future<void> _addTodo(TodoBlocAddTodoEvent event, Emitter emit) async {
    emit(TodoBlocLoadedState());

    //* Типо долго удаляется
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _completeTodo(TodoBlocCompleteTodoEvent event, Emitter emit) async {}

  Future<void> _loadTodo(TodoBlocLoadTodoEvent event, Emitter emit) async {
    emit(TodoBlocLoadedState());

    //* Типо долго удаляется
    await Future.delayed(const Duration(seconds: 2));
  }
}
