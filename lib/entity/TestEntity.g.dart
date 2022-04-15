// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatEntity _$TestEntityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TestEntity',
      json,
      ($checkedConvert) {
        final val = ChatEntity(
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          stars: $checkedConvert('stars', (v) => v as int? ?? 0),
        );
        return val;
      },
    );

Map<String, dynamic> _$TestEntityToJson(ChatEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stars': instance.stars,
    };
