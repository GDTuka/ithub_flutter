// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      description: json['description'] as String,
      name: json['name'] as String,
      todoEnum: $enumDecode(_$TodoEnumEnumMap, json['todoEnum']),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'todoEnum': _$TodoEnumEnumMap[instance.todoEnum]!,
    };

const _$TodoEnumEnumMap = {
  TodoEnum.big: 'big',
  TodoEnum.medium: 'medium',
  TodoEnum.small: 'small',
};
