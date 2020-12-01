import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/models/message_model.dart';
import 'package:flutter_chat_ui/screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite contacts',
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 18,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 6.9,
            // color: Colors.blue,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChatScreen(user: favorites[index])));
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(favorites[index].imageUrl),
                          radius: 34.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(favorites[index].name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
