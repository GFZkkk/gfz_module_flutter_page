// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      sessionId: json['sessionId'] as String? ?? "",
      sortId: json['sortId'] as int? ?? 0,
      lastMessage: json['lastMessage'] as String? ?? "",
      lastTime: json['lastTime'] as int? ?? 0,
      messageId: json['messageId'] as String? ?? "",
      unReadNum: json['unReadNum'] as int? ?? 0,
    );

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'sortId': instance.sortId,
      'lastMessage': instance.lastMessage,
      'lastTime': instance.lastTime,
      'messageId': instance.messageId,
      'unReadNum': instance.unReadNum,
    };
