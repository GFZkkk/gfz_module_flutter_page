
import 'package:json_annotation/json_annotation.dart';
part 'TestEntity.g.dart';

@JsonSerializable()
class TestEntity{
  @JsonKey(defaultValue: "")
  String name;
  int stars;

  TestEntity({
    required this.name,
    this.stars = 0,
  });

  factory TestEntity.fromJson(Map<String, dynamic> json) => _$TestEntityFromJson(json);
}