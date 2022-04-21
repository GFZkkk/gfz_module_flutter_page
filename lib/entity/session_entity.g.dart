// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) =>
    SessionEntity(
      id: json['id'] as String? ?? "",
      avatarUrl: json['avatarUrl'] as String? ?? "",
      userName: json['userName'] as String? ?? "",
      sessionId: json['sessionId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      lastTime: json['lastTime'] as int? ?? 0,
      lastMessage: json['lastMessage'] as String? ?? "",
      unReadNum: json['unReadNum'] as int? ?? 0,
      sortId: json['sortId'] as int? ?? 0,
    )..lastTimeStr = json['lastTimeStr'] as String? ?? '';

Map<String, dynamic> _$SessionEntityToJson(SessionEntity instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'sortId': instance.sortId,
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'userName': instance.userName,
      'messageId': instance.messageId,
      'lastMessage': instance.lastMessage,
      'lastTime': instance.lastTime,
      'unReadNum': instance.unReadNum,
      'lastTimeStr': instance.lastTimeStr,
    };
