import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/widgets/catergory_select.dart';
import 'package:flutter_chat_ui/widgets/favorite_contacts_widget.dart';
import 'package:flutter_chat_ui/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            iconSize: 30.0,
            color: Colors.white),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              iconSize: 30.0,
              color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: [
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
