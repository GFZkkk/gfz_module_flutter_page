import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter_page/entity/message_entity.dart';
import 'package:flutter_page/entity/session_entity.dart';
import 'package:flutter_page/provider/session_model.dart';

class TestUtil {
  static const String def =
      'https://c-ssl.duitang.com/uploads/item/201803/04/20180304085215_WGFx8.thumb.700_0.jpeg';

  static Random random = Random();

  static Set<String> sessionIdSet = {};

  static void init() async {
    sessionProvider.notifier;
  }

  static Future<List<SessionEntity>> testLoadAllSession() async {
    await netWorkTime();
    return [for (var i = 0; i < 5; i++) getTestSessionEntity(null)];
  }

  static List<SessionEntity> testSyncAllSession() {
    return [for (var i = 0; i < 5; i++) getTestSessionEntity(null)];
  }

  static Future<List<SessionEntity>> testLoadUser(List<String> ids) async {
    await netWorkTime();
    return [for (final id in ids) getTestSessionEntity(id)];
  }

  static SessionEntity getTestSessionEntity(String? id) {
    id ??= random.nextInt(10).toString();
    final messageId = random.nextInt(10000);
    sessionIdSet.add(id.toString());
    return SessionEntity(
        id: id.toString(),
        avatarUrl: def,
        userName: "test$id",
        sessionId: id.toString(),
        messageId: messageId.toString(),
        sortId: DateTime.now().millisecondsSinceEpoch,
        unReadNum: 1,
        lastMessage: generateWordPairs(maxSyllables: 3, random: random).toString(),
        lastTime: DateTime.now().millisecondsSinceEpoch);
  }

  static MessageEntity getTestMessageEntity() {
    final id = random.nextInt(10);
    final messageId = random.nextInt(10000);
    return MessageEntity(
        sessionId: id.toString(),
        messageId: messageId.toString(),
        lastMessage: generateWordPairs(maxSyllables: 3, random: random).toString(),
        lastTime: DateTime.now().millisecondsSinceEpoch,
        sortId: DateTime.now().millisecondsSinceEpoch,
        unReadNum: 1);
  }

  static Future<void> netWorkTime({int bound = 3000}) async{
    int time = random.nextInt(bound);
    await Future.delayed(Duration(milliseconds: time));
  }
}
