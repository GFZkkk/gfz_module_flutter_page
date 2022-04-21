import 'package:flutter_page/entity/session_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'session_list_entity.g.dart';

@JsonSerializable()
class SessionListEntity{
  @JsonKey(defaultValue: [])
  List<SessionEntity> list;

  SessionListEntity({
    required this.list,
  });

  factory SessionListEntity.fromJson(Map<String, dynamic> json) =>
      _$SessionListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SessionListEntityToJson(this);
}