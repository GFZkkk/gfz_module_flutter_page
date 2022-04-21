import 'dart:developer';

import 'package:flutter_page/config/contacts.dart';
import 'package:flutter_page/entity/message_entity.dart';
import 'package:flutter_page/entity/session_entity.dart';
import 'package:flutter_page/entity/session_list_entity.dart';
import 'package:flutter_page/utils/sp_util.dart';
import 'package:flutter_page/utils/test_util.dart';
import 'package:riverpod/riverpod.dart';

final sessionProvider = StateNotifierProvider<SessionModel, List<SessionEntity>>((ref) {
  return SessionModel();
});

typedef Update<T> = T Function(T session);

class SessionModel extends StateNotifier<List<SessionEntity>> {
  SessionModel() : super([]){
    addListener((state) {
      bool nowState = false;
      for(final session in state){
        if (session.unReadNum > 0) {
          nowState = true;
          break;
        }
      }
      notifyUnReadStateChanged(nowState);
    });
  }

  Map<String, SessionEntity> sessionMap = {};
  Set<String> noUserSet = {};

  bool haveNewMessage = false;

  bool updateSessionListSuccess = true;

  notifyUnReadStateChanged(bool nowState){
    if (nowState == haveNewMessage) {
      return;
    }
    haveNewMessage = nowState;
    log(haveNewMessage ? "有新消息" : "没有新消息");
  }

  /// 加载本地会话列表
  Future<void> loadLocalSessionList() async {
    final localJson = await SPUtil.getJsonValue(SP.SESSION_LIST);
    if (localJson != null) {
      final localData = SessionListEntity.fromJson(localJson);
      addSessionList(localData.list);
      loadNoUserSession();
    }
  }

  /// 保存最新的会话列表
  /// 不需要调用的过于频繁
  /// 需要将没有用户信息的也保存下来
  Future<void> saveSessionList() async {
    final allList = sessionMap.values.toList();
    allList.sort((a, b) => a.sortId.compareTo(b.sortId));
    final entity = SessionListEntity(list: allList);
    SPUtil.storeString(SP.SESSION_LIST, entity.toJson().toString());
  }

  Future<void> updateSessionList() async {
    final sessionList = await TestUtil.testLoadAllSession();
    addSessionList(sessionList);
    loadNoUserSession();
  }

  Future<void> loadNoUserSession() async {
    if (noUserSet.isEmpty) {
      return;
    }
    final sessionList = await TestUtil.testLoadUser(noUserSet.toList());
    addSessionList(sessionList);
  }

  /// 如果
  Future<void> retryFailRequest() async {
    if (!updateSessionListSuccess) {
      await updateSessionList();
    }
    loadNoUserSession();
  }

  addMessage(MessageEntity entity) {
    log("addMessage${entity.toJson().toString()}");
    var session = sessionMap[entity.sessionId];
    session ??= SessionEntity();
    session = session.addMessage(entity);
    addSession(session);
    loadNoUserSession();
  }

  addSession(SessionEntity entity){
    sessionMap[entity.sessionId] = entity;
    if (entity.isSession()) {
      _addSessionToList(entity);
      noUserSet.remove(entity.sessionId);
    } else {
      noUserSet.add(entity.sessionId);
    }
  }

  addSessionList(List<SessionEntity> list){
    final sessionList = <SessionEntity>[];
    for(final entity in list){
      sessionMap[entity.sessionId] = entity;
      if (entity.isSession()) {
        sessionList.add(entity);
        noUserSet.remove(entity.sessionId);
      } else {
        noUserSet.add(entity.sessionId);
      }
    }
    _addSessionListToList(sessionList);
  }

  deleteSession(SessionEntity entity){
    sessionMap.remove(entity.sessionId);
    state = [
      for(final session in state)
        if(session != entity)
          session
    ];
  }

  updateSession(String sessionId, Update<SessionEntity> update) {
    var session = sessionMap[sessionId];
    if (session == null) {
      return;
    }
    session = update(session);

    sessionMap[sessionId] = session;
    state = [
      for (final data in state)
        if (data.sessionId == sessionId) session else data
    ];
  }

  _addSessionToList(SessionEntity entity) {
    log("addMessage${entity.toJson().toString()}");
    var newList = <SessionEntity>[];
    // 此会话是否已经插入到会话列表中
    var hasInsert = false;

    for (final data in state) {
      // 如果还没有插入
      if (!hasInsert) {
        // 是否可以插入到会话列表中
        if (entity.sortId >= data.sortId) {
          newList.add(entity);
          hasInsert = true;
        }
      }
      // 如果该会话还没有被插入，且已经存在列表中，则说明列表中的更新。
      if (data.sessionId != entity.sessionId) {
        newList.add(data);
      } else if (!hasInsert) {
        newList.add(data);
        hasInsert = true;
      }
    }
    state = newList;
  }

  /// 合并会话列表
  /// 请保证新插入的会话列表有序
  _addSessionListToList(List<SessionEntity> list) {
    // 已经加入到新列表中的sessionId
    final Set<String> sessionIdSet = {};

    var i = 0;
    var j = 0;
    final oldLength = state.length;
    final addLength = list.length;

    state = [
      for (; i < oldLength; i++) ...[
        // 将插入列表中比当前会话时间更早的所有会话加入到新列表中
        for (; j < addLength && list[j].sortId >= state[i].sortId; j++) ...[
          if (!sessionIdSet.contains(list[j].sessionId)) _addSessionIdToSet(sessionIdSet, list[j])
        ],
        if (!sessionIdSet.contains(state[i].sessionId)) state[i]
      ],
      for (; j < addLength; j++) ...[
        if (!sessionIdSet.contains(list[j].sessionId)) _addSessionIdToSet(sessionIdSet, list[j])
      ]
    ];
  }

  SessionEntity _addSessionIdToSet(Set<String> sessionIdSet, SessionEntity entity) {
    sessionIdSet.add(entity.sessionId);
    return entity;
  }

}
