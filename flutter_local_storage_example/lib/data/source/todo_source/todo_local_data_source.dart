import 'dart:convert';

import 'package:flutter_local_storage_example/data/models/todo_list_model/todo_list_model.dart';
import 'package:flutter_local_storage_example/data/models/todo_model/todo_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TodoLocalDataSource {
  String key = 'key2';

  String todosKeys = 'todosKeys';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<TodoListModel?> loadTodo() async {
    String? data = await _secureStorage.read(key: key);

    if (data == null) return null;

    TodoListModel todoListModel = TodoListModel.fromJson(jsonDecode(data));
    return todoListModel;
  }

  Future<void> saveTodo(TodoModel todoModel) async {
    TodoListModel? todoListModels = await loadTodo();

    if (todoListModels == null) {
      TodoListModel todoListModelNew = TodoListModel([todoModel]);
      await _secureStorage.write(key: key, value: jsonEncode(todoListModelNew));
      return;
    }

    todoListModels.todoListModel!.add(todoModel);

    await _secureStorage.write(key: key, value: jsonEncode(todoListModels));
  }

  Future<void> deleteAllTodo() async {
    await _secureStorage.deleteAll();
  }

  Future<void> deleteTodo() async {}
}
