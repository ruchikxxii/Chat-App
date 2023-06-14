import 'package:chat_app/chat_screen.dart';
import 'package:chat_app/meesages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MessageBloc(),
    child: MaterialApp(
      home: MainPage(),
    ),
  ));
}