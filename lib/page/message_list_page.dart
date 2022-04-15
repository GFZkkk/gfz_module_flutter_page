import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'message_room_page.dart';

class MessageListPage extends StatelessWidget {
  static const routerName = "MessageListPage";

  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("消息列表页面"),
        centerTitle: true,
      ),
      body: const MessageRoomList(),
    );
  }
}

class MessageRoomList extends StatefulWidget {
  const MessageRoomList({Key? key}) : super(key: key);

  @override
  State<MessageRoomList> createState() => _MessageRoomListState();
}

class _MessageRoomListState extends State<MessageRoomList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("小明$i"),
          onTap: () {
            log("小明$i");
            // Navigator.of(context)
            //     .pushNamed(MessageRoomPage.routerName, arguments: {'id', i.toString()});
            BoostNavigator.instance.push(MessageRoomPage.routerName,
                arguments: {'id': i.toString()});
          },
        );
      },
      itemCount: 100,
      separatorBuilder: (context, i) {
        return const Divider(height: 1);
      },
    );
  }
}
