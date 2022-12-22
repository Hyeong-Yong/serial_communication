import 'package:flutter/material.dart';
import 'package:serial_communication_hy/Page/Page.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
      title: 'Chat',
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }
}

class SerialChatList extends StatelessWidget {
  const SerialChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
