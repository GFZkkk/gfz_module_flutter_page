import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page/config/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/session_entity.dart';
import '../provider/session_model.dart';
import '../utils/test_util.dart';

class MessageListPage extends ConsumerWidget {
  static const routerName = "MessageListPage";

  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "消息",
          style: TextStyle(color: Color(0xff2C2E34), fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const SessionList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {
          ref.read(sessionProvider.notifier).addMessage(TestUtil.getTestMessageEntity());
        },
      ),
    );
  }
}

class SessionList extends ConsumerStatefulWidget {
  const SessionList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SessionListState();
  }
}

class _SessionListState extends ConsumerState<SessionList> {
  @override
  void initState() {
    super.initState();
    ref.read(sessionProvider.notifier).loadLocalSessionList();
    ref.read(sessionProvider.notifier).updateSessionList();
  }

  @override
  void dispose() {
    ref.read(sessionProvider.notifier).saveSessionList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionList = ref.watch(sessionProvider);
    return ListView(
      children: [
        for (final session in sessionList) ...[
          SessionItem(session),
        ]
      ],
    );
  }
}

class SessionItem extends ConsumerWidget {
  final SessionEntity session;
  final bool showDivider;

  const SessionItem(this.session, {this.showDivider = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 72,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10, bottom: 12),
                  child: Avatar(session.avatarUrl, session.unReadNum > 0),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Expanded(
                                  child: Text(
                                session.userName,
                                style: AppStyles.nameStyle,
                              )),
                              Text(
                                session.lastTimeStr,
                                style: AppStyles.timeStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 22),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          session.lastMessage,
                          style: AppStyles.messageStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          onTap: (){
            log("点击：${session.sessionId}");
            ref.read(sessionProvider.notifier).updateSession(session.sessionId, (session) {
              return session.copyWith(unReadNum: 0);
            });
          },
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 12,
            endIndent: 36,
            thickness: 1,
            color: AppColors.col_efefef,
          )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final String url;
  final bool hasNewMessage;

  const Avatar(this.url, this.hasNewMessage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: CachedNetworkImage(
                  width: 48,
                  height: 48,
                  imageUrl: url,
                  placeholder: (ctx, url) {
                    return Image.asset("assets/images/info_gender_girl_unsel.webp");
                  },
                  errorWidget: (ctx, url, error) {
                    return Image.asset("assets/images/info_gender_girl_unsel.webp");
                  }),
            ),
            top: 2,
          ),
          if (hasNewMessage)
            Positioned(
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.col_ff2b2b,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 0)
                  ]),
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
