import 'dart:convert';

import 'package:flutter_elementary_example/data/models/todo/todo_list_model.dart';
import 'package:flutter_elementary_example/data/models/todo/todo_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TodoLocalDS {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  String key = 'todoListModelKey';

  Future<void> saveTodo(TodoModel newTodo) async {
    List<TodoModel> todoModels = await loadTodo();

    TodoListModel todoListModel = TodoListModel(todoModels);

    todoListModel.todoListModel.add(newTodo);

    await _secureStorage.write(key: key, value: jsonEncode(todoListModel.toJson()));
  }

  Future<List<TodoModel>> loadTodo() async {
    String? res = await _secureStorage.read(key: key);

    if (res == null) return [];

    TodoListModel? todoListModel = TodoListModel.fromJson(jsonDecode(res));

    return todoListModel.todoListModel;
  }

  Future<bool> deleteTodo(int index) async {
    List<TodoModel> todoModels = await loadTodo();

    TodoListModel todoListModel = TodoListModel(todoModels);

    try {
      todoListModel.todoListModel.removeAt(index);
    } catch (e) {
      return false;
    }

    return true;
  }
}
