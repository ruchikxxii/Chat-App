import 'package:chat_app/chat_screen.dart';
import 'package:chat_app/meesages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  int index;
  ImageProvider<Object> img;
  String name;

  User({required this.index, required this.img, required this.name});
}

List<User> users = [
  User(
      index: 0,
      img: NetworkImage(
          "https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest/scale-to-width-down/1200?cb=20170716092103"),
      name: "Sasuke"),
  User(
      index: 1,
      img: NetworkImage(
          "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"),
      name: "Naruto"),
];

Widget genUsers(user) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: user.img,
            ),
            SizedBox(width: 10.0,),
            Text(
              user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
      Divider(
        thickness: 2.0,
        height: 5.0,
        color: Colors.grey[600],
      ),
    ],
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "One Chat",
          style: TextStyle(
              color: Colors.grey[500]
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: users.map((user) {
            return TextButton(
                onPressed: () {
                  context.read<MessageBloc>().add(
                    readMessage(author: user.name)
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return chat_screen(cur_user: user.index,);
                  }),);
                },
                child: genUsers(user)
            );
          }).toList(),
        ),
      ),
    );
  }
}
