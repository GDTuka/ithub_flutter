import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum TodoEnum {
  @JsonValue('big')
  big,
  @JsonValue('medium')
  medium,
  @JsonValue('small')
  small,
}
