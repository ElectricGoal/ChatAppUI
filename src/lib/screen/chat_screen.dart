import 'package:chats_app/models/message.dart';
import 'package:chats_app/models/user.dart';
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
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
              )
            ],
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                          letterSpacing: 1.0),
                    ),
                    Row(
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
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
                    )),
              ),
            ),
            _buildInputSpace(context)
          ],
        ));
  }
}

Widget _buildInputSpace(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    color: Theme.of(context).accentColor,
    child: Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            onChanged: (value) {},
            decoration:
                InputDecoration.collapsed(hintText: "Type a message..."),
          )),
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
      ),
    ),
  );
}

Widget _buildMessage(Message message, bool isMe) {
  return isMe == true
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                message.time!,
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Flexible(
              child: Container(
                margin:
                    EdgeInsets.only(left: 50, top: 10, bottom: 10, right: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Text(message.text!),
              ),
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
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        margin: EdgeInsets.only(
                            right: 50, top: 10, bottom: 10, left: 6),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            )),
                        child: Text(message.text!),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        message.time!,
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}


