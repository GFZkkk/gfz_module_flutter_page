// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionListEntity _$SessionListEntityFromJson(Map<String, dynamic> json) =>
    SessionListEntity(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => SessionEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SessionListEntityToJson(SessionListEntity instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
