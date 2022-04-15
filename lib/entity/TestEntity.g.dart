// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestEntity _$TestEntityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TestEntity',
      json,
      ($checkedConvert) {
        final val = TestEntity(
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          stars: $checkedConvert('stars', (v) => v as int? ?? 0),
        );
        return val;
      },
    );

Map<String, dynamic> _$TestEntityToJson(TestEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stars': instance.stars,
    };
