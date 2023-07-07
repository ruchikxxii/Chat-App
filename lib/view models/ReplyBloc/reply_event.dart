part of 'reply_bloc.dart';

@immutable
abstract class ReplyEvent {}

class EnableReply extends ReplyEvent {
  String replyText;
  int replyIndex;
  EnableReply({
    required this.replyText,
    required this.replyIndex
  });
}

class DisableReply extends ReplyEvent {}