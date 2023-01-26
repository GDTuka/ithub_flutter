import 'package:flutter_local_storage_example/data/models/todo_model/todo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_list_model.g.dart';

@JsonSerializable()
class TodoListModel {
  TodoListModel(this.todoListModel);
  List<TodoModel>? todoListModel;

  factory TodoListModel.fromJson(Map<String, dynamic> json) => _$TodoListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListModelToJson(this);
}
