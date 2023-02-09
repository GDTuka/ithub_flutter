abstract class TodoBlocEvent {}

class TodoBlocDeleteEvent extends TodoBlocEvent {
  TodoBlocDeleteEvent(this.index);
  int index;
}

class TodoBlocCompleteTodoEvent extends TodoBlocEvent {}

class TodoBlocAddTodoEvent extends TodoBlocEvent {}

class TodoBlocLoadTodoEvent extends TodoBlocEvent {}
