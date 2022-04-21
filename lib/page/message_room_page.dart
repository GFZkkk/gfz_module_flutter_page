import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageRoomPage extends StatefulWidget {
  static const routerName = "MessageRoomPage";

  const MessageRoomPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<MessageRoomPage> createState() => _MessageRoomPageState();
}

class _MessageRoomPageState extends State<MessageRoomPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小明${widget.id}"),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 13),
            leading: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Color(0xffFF950A)
              ),
              width: 6.0,
              height: 19.0,
            ),
            title: const Text(
              "学生信息",
              style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff434343)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      log(_controller.text);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Widget _getTitle(String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xffFF950A)
        ),
        width: 6.0,
        height: 19.0,
      ),
      const Text(
        "学生信息",
        style:
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff434343)),
      )
    ],
  );
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
