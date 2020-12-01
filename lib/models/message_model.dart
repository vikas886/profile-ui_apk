import 'package:flutter_chat_ui/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

// ignore: non_constant_identifier_names
final User currentUser = User(
    id: 0,
    name: 'CurrentUser',
    imageUrl: 'https://randomuser.me/api/portraits/men/85.jpg');
final User vikas = User(
    id: 1,
    name: 'Vikas',
    imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg');
final User kunjum = User(
    id: 2,
    name: 'Kunjum',
    imageUrl: 'https://randomuser.me/api/portraits/women/31.jpg');
final User puneet = User(
    id: 3,
    name: 'Punnet',
    imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg');
final User pawan = User(
    id: 4,
    name: 'Pawan',
    imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg');
final User raj = User(
    id: 5,
    name: 'Raj',
    imageUrl: 'https://randomuser.me/api/portraits/men/39.jpg');

List<User> favorites = [kunjum, puneet, pawan, vikas, raj];

List<Message> chats = [
  Message(
      sender: pawan,
      time: '4:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: true),
  Message(
      sender: puneet,
      time: '2:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: true),
  Message(
      sender: kunjum,
      time: '1:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: false),
  Message(
      sender: raj,
      time: '12:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: false),
  Message(
      sender: vikas,
      time: '12:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: false),
  Message(
      sender: raj,
      time: '12:52 PM',
      text: 'Hey,how you doing !flutter.',
      isLiked: false,
      unread: false),
];

List<Message> messages = [
  Message(
      sender: pawan,
      time: '4:52 PM',
      text: 'What Is Something That Is Popular Now That Annoys You?',
      isLiked: false,
      unread: true),
  Message(
      sender: puneet,
      time: '2:52 PM',
      text: ' What Is The Most Annoying Habit Someone Can Have?',
      isLiked: false,
      unread: true),
  Message(
      sender: kunjum,
      time: '1:52 PM',
      text: 'What Is Something That Really Annoys You But Doesn’t Bother Most People?',
      isLiked: false,
      unread: false),
  Message(
      sender: raj,
      time: '12:52 PM',
      text: 'Where Is The Worst Place You Have Been Stuck For A Long Time?',
      isLiked: true,
      unread: false),
];
