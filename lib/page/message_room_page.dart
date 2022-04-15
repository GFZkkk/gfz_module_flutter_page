import 'package:flutter/material.dart';

class MessageRoomPage extends StatefulWidget {
  static const routerName = "MessageRoomPage";

  const MessageRoomPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<MessageRoomPage> createState() => _MessageRoomPageState();
}

class _MessageRoomPageState extends State<MessageRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小明${widget.id}"),
        centerTitle: true,
      ),
      body: Row(
        children: const [
          MessageList(),
        ],
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
