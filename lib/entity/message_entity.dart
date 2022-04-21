
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_entity.g.dart';

@immutable
@JsonSerializable()
class MessageEntity{
  final String sessionId;
  final int sortId;
  final String lastMessage;
  final int lastTime;
  final String messageId;
  final int unReadNum;

  const MessageEntity({
    this.sessionId = "",
    this.sortId = 0,
    this.lastMessage = "",
    this.lastTime = 0,
    this.messageId = "",
    this.unReadNum = 0
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}