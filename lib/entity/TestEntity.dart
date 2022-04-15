
import 'package:json_annotation/json_annotation.dart';
part 'TestEntity.g.dart';

@JsonSerializable()
class ChatEntity{
  @JsonKey(defaultValue: "")
  String name;
  int stars;

  ChatEntity({
    required this.name,
    this.stars = 0,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) => _$TestEntityFromJson(json);
}