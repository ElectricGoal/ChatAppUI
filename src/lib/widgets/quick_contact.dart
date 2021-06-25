import 'package:chats_app/models/message.dart';
import 'package:chats_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuickContact extends StatelessWidget {
  const QuickContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 76),
            child: ListView.builder(
              //padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: quicks.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(user: quicks[index]))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(quicks[index].imageUrl!),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          quicks[index].name!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

