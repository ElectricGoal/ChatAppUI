import 'package:chats_app/models/user.dart';
import 'package:chats_app/screen/chat_screen_components.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BackAndSearchButton(),
        elevation: 0,
      ),
      body: Column(
        children: [
          NameAndCall(widget: widget),
          Expanded(
            child: ChatZone(),
          ),
          _buildInputSpace(context)
        ],
      ),
    );
  }
}

Widget _buildInputSpace(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 15,
    ),
    color: Theme.of(context).accentColor,
    child: Container(
      padding: EdgeInsets.only(
        left: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(40),
      ),
      child: InputSpace(),
    ),
  );
}

class InputSpace extends StatelessWidget {
  const InputSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {},
            decoration:
                InputDecoration.collapsed(hintText: "Type a message..."),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
        ),
      ],
    );
  }
}


