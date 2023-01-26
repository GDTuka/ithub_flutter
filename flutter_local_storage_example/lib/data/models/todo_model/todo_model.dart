import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

//* Аннотация чтобы кодогенератор понимал, что ему нужно сгенирироваать
@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.description,
    required this.header,
  });
  String header;
  String description;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
