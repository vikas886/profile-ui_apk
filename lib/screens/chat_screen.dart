import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  // ChatScreen({Key key}) : super(key: key);
  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .75,
          margin: isMe
              ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
              : EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0))
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                message.text,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 30,
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
                onPressed: () {})
            : SizedBox.shrink(),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            onPressed: () {},
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration:
                InputDecoration.collapsed(hintText: 'Send a message...'),
          )),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            onPressed: () {},
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap:()=>FocusScope.of(context).unfocus(),
              child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                    reverse: true,
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
