import 'package:flutter_elementary_example/data/models/enum/todo_model_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.description,
    required this.name,
    required this.todoEnum,
  });
  String description;
  String name;
  TodoEnum todoEnum;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
