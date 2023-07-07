import 'package:chat_app/models/message.dart';
import 'package:chat_app/view models/ReplyBloc/reply_bloc.dart';
import 'package:chat_app/views/chat_screen.dart';
import 'package:chat_app/view%20models/meesages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'views/main_page.dart';

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MessageBloc(),
      ),
      BlocProvider(
        create: (context) => ReplyBloc(),
      ),
    ],
    child: MaterialApp(
      home: MainPage(),
    ),
  ));
}