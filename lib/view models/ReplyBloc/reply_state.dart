part of 'reply_bloc.dart';

@immutable
abstract class ReplyState {}

class ReplyInitial extends ReplyState {}

class ReplyEnabled extends ReplyState {
  final String replyText;
  final int replyIndex;
  ReplyEnabled({
    required this.replyText,
    required this.replyIndex
  });
}

class ReplyDisabled extends ReplyState {}
