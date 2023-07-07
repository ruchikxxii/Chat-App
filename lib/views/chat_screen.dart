import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view models/ReplyBloc/reply_bloc.dart';
import '../view models/meesages_bloc.dart';
import '../models/message.dart';

class User {
  ImageProvider<Object> img;
  String name;

  User({required this.img, required this.name});
}

class chat_screen extends StatelessWidget {
  int cur_user = 0;

  chat_screen({super.key, required this.cur_user});

  InputBorder getBorder(bool x) {
    if (x) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40.0),
        ),
      );
    } else {
      return OutlineInputBorder(
        borderSide: BorderSide(
          width: 3.0,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      );
    }
  }

  Widget getReply(ReplyState x, add) {
    if (x is ReplyEnabled) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          border: Border.all(
              color: Colors.black, width: 0),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0)),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border.all(
                  color: Colors.black, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 8.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  x.replyText,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {
                    add(DisableReply());
                  },
                  icon: Icon(Icons.clear,
                    color: Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    else {
      return Container();
    }
  }

  Widget getMessageReply(String replyText) {
    if (replyText == "") {
      return Container();
    }
    else {
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey[900],
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 8.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Text(replyText,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 16.0,
            ),
          ),
        ),
      );
    }
  }

  Widget genMessage(msg) {
    return Row(
        mainAxisAlignment: msg.author == users[cur_user].name
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 15.0),
            color: Colors.grey[800],
            child: SizedBox(
              width: 250.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    getMessageReply(msg.replyText),
                    msg.replyText==""?Container():SizedBox(height: 10.0,),
                    Text(msg.msg,
                        textAlign: msg.author == users[cur_user].name
                            ? TextAlign.right
                            : TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.3,
                            color: Colors.white)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "${msg.time.hour}:${msg.time.minute}",
                          textAlign: msg.author == users[cur_user].name
                              ? TextAlign.left
                              : TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        msg.author == users[cur_user].name
                            ? Expanded(child: Container())
                            : Container(),
                        msg.author == users[cur_user].name
                            ? Icon(
                          Icons.check,
                          color: msg.read == true
                              ? Colors.blue
                              : Colors.grey[600],
                        )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
  }

  final textcotroller = TextEditingController();
  final scrollcontroller = ScrollController();

  List<User> users = [
    User(
        img: NetworkImage(
            "https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest/scale-to-width-down/1200?cb=20170716092103"),
        name: "Sasuke"),
    User(
        img: NetworkImage(
            "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"),
        name: "Naruto"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: users[cur_user].img,
                ),
              ],
            ),
            SizedBox(
              width: 25.0,
            ),
            Text(users[cur_user].name)
          ],
        ),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 25.0, 5.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
                  controller: scrollcontroller,
                  child: BlocBuilder<MessageBloc, List<Message>>(
                    builder: (context, state) {
                      return Column(
                        children: state.map((msg) {
                          return GestureDetector(
                            onLongPress: () {
                              context.read<ReplyBloc>().add(EnableReply(
                                  replyText: msg.msg, replyIndex: 0));
                            },
                            child: genMessage(msg),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )),
            BlocBuilder<ReplyBloc, ReplyState>(
              builder: (context, state) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            getReply(state, context
                                .read<ReplyBloc>()
                                .add),
                            TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              cursorColor: Colors.greenAccent,
                              controller: textcotroller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[800],
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "Type Your message here",
                                enabledBorder: getBorder(state is ReplyEnabled),
                                focusedBorder: getBorder(state is ReplyEnabled),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    textcotroller.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        String replyText = "";
                        if(state is ReplyEnabled){
                          replyText = state.replyText;
                        }
                        context.read<MessageBloc>().add(newMessage(
                            new_msg: Message(
                              msg: textcotroller.text,
                              author: users[cur_user].name,
                              time: DateTime.now(),
                              replyText: replyText,
                            )));
                        context.read<ReplyBloc>().add(DisableReply());
                        scrollcontroller.animateTo(
                            scrollcontroller.position.maxScrollExtent,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        textcotroller.clear();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.greenAccent,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
