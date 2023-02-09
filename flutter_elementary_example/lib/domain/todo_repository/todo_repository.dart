import 'package:flutter_elementary_example/data/models/todo/todo_model.dart';
import 'package:flutter_elementary_example/data/source/todo_local_ds.dart';

class TodoRepository {
  TodoRepository(
    this._todoLocalDS,
  );
  final TodoLocalDS _todoLocalDS;

  Future<void> saveTodo(TodoModel todoModel) => _todoLocalDS.saveTodo(todoModel);

  Future<List<TodoModel>> loadTodo() => _todoLocalDS.loadTodo();

  Future<bool> deleteTodo(int index) => _todoLocalDS.deleteTodo(index);
}
