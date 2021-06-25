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
        toolbarHeight: 150,
        title: Text(
          "Chat with \nyour friends",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              wordSpacing: 1.0,
              letterSpacing: 1.0),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          QuickContact(),
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
                child: ReccentChat()),
            ),
          )
        ],
      ),
    );
  }
}
