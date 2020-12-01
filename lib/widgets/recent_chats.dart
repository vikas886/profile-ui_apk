import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/screens/chat_screen.dart';

class RecentChats extends StatefulWidget {
  RecentChats({Key key}) : super(key: key);

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color:
                        chats[index].unread ? Color(0xFFFFEFEE) : Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(user: chats[index].sender)));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chats[index].sender.imageUrl),
                    radius: 30,
                  ),
                  title: Text(
                    chats[index].sender.name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  subtitle: Text(
                    chats[index].text,
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        chats[index].time,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      chats[index].unread
                          ? Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Theme.of(context).primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'New',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Text(""),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
