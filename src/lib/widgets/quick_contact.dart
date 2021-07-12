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
            child: SearchButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 76,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: quicks.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return ContactList(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ContactList extends StatelessWidget {
  ContactList({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatScreen(user: quicks[index]),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: _SenderInfo(index: index),
      ),
    );
  }
}

class _SenderInfo extends StatelessWidget {
  const _SenderInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
