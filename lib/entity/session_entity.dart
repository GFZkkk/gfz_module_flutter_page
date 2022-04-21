
import 'package:flutter/cupertino.dart';
import 'package:flutter_page/entity/message_entity.dart';
import 'package:flutter_page/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/time_util.dart';
part 'session_entity.g.dart';

@immutable
@JsonSerializable()
class SessionEntity{
  final String sessionId;
  final int sortId;

  final String id;
  final String avatarUrl;
  final String userName;

  final String messageId;
  final String lastMessage;
  final int lastTime;
  final int unReadNum;

  @JsonKey(defaultValue: "")
  late final String lastTimeStr;

  SessionEntity({
    this.id = "",
    this.avatarUrl = "",
    this.userName = "",
    this.sessionId = "",
    this.messageId = "",
    this.lastTime = 0,
    this.lastMessage = "",
    this.unReadNum = 0,
    this.sortId = 0,
  }){
    lastTimeStr = TimeUtil.getTimeStr(lastTime);
  }

  factory SessionEntity.fromJson(Map<String, dynamic> json) => _$SessionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SessionEntityToJson(this);

  bool isSession(){
    return id.isNotEmpty;
  }

  SessionEntity addMessage(MessageEntity entity){
    return copyWith(
        sessionId: entity.sessionId,
        sortId: entity.sortId,
        lastTime: entity.lastTime,
        lastMessage: entity.lastMessage,
        unReadNum: entity.unReadNum
    );
  }

  SessionEntity copyWith({
    String? sessionId,
    int? sortId,
    String? id,
    String? avatarUrl,
    String? userName,
    String? messageId,
    String? lastMessage,
    int? lastTime,
    int? unReadNum,
  }) {
    return SessionEntity(
      sessionId: sessionId ?? this.sessionId,
      sortId: sortId ?? this.sortId,
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      userName: userName ?? this.userName,
      messageId: messageId ?? this.messageId,
      lastMessage: lastMessage ?? this.lastMessage,
      lastTime: lastTime ?? this.lastTime,
      unReadNum: unReadNum ?? this.unReadNum,
    );
  }
}