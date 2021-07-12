import 'package:chats_app/widgets/quick_contact.dart';
import 'package:chats_app/widgets/reccent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: HeaderText(),
        elevation: 0,
      ),
      body: Column(
        children: [
          QuickContact(),
          Expanded(
            child: ReccentChatSpace(),
          ),
        ],
      ),
    );
  }
}

class ReccentChatSpace extends StatelessWidget {
  const ReccentChatSpace({
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
        child: ReccentChat(),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Chat with \nyour friends",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        wordSpacing: 1.0,
        letterSpacing: 1.0,
      ),
    );
  }
}
