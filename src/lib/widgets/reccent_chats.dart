import 'dart:ui';

import 'package:chats_app/models/message.dart';
import 'package:chats_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class ReccentChat extends StatelessWidget {
  const ReccentChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(user: chat.sender!))),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(chat.sender!.imageUrl!),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat.sender!.name!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          chat.time!,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(
                      chat.text!,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            }));
  }
}
