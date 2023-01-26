// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) =>
    TodoListModel(
      (json['todoListModel'] as List<dynamic>?)
          ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodoListModelToJson(TodoListModel instance) =>
    <String, dynamic>{
      'todoListModel': instance.todoListModel,
    };
