import 'package:chats_app/models/message.dart';
import 'package:chats_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatZone extends StatelessWidget {
  const ChatZone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            final Message message = messages[index];
            final bool isMe = message.sender!.id! == currentUser.id;
            return _buildMessage(message, isMe);
          },
        ),
      ),
    );
  }
}

class NameAndCall extends StatelessWidget {
  const NameAndCall({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ChatScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.user.name!,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                wordSpacing: 1.0,
                letterSpacing: 1.0,
              ),
            ),
            CallButton()
          ],
        ),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white30,
          ),
          child: Icon(
            Icons.phone,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(
          width: 23,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white30,
          ),
          child: Icon(
            Icons.videocam_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class BackAndSearchButton extends StatelessWidget {
  const BackAndSearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
            ),
          ),
        ),
        Text(
          "Search",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}

Widget _buildMessage(Message message, bool isMe) {
  return isMe == true
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TimeText(
              message: message,
            ),
            MessageText(
              message: message,
            ),
          ],
        )
      : Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(message.sender!.imageUrl!),
              ),
              SenderMessage(message: message),
            ],
          ),
        );
}

// ignore: must_be_immutable
class SenderMessage extends StatelessWidget {
  SenderMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  Message message;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SenderText(message: message),
          SenderTime(message: message),
        ],
      ),
    );
  }
}

class SenderTime extends StatelessWidget {
  const SenderTime({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
      ),
      child: Text(
        message.time!,
        style: TextStyle(
          color: Colors.black26,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class SenderText extends StatelessWidget {
  const SenderText({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        margin: EdgeInsets.only(
          right: 50,
          top: 10,
          bottom: 10,
          left: 6,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Text(message.text!),
      ),
    );
  }
}

// ignore: must_be_immutable
class TimeText extends StatelessWidget {
  TimeText({
    Key? key,
    required this.message,
  }) : super(key: key);
  Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        message.time!,
        style: TextStyle(
          color: Colors.black26,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageText extends StatelessWidget {
  MessageText({
    Key? key,
    required this.message,
  }) : super(key: key);

  Message message;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(
          left: 50,
          top: 10,
          bottom: 10,
          right: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Text(message.text!),
      ),
    );
  }
}
