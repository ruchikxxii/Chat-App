import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String msg,
    required String author,
    required DateTime time,
    @Default(false)bool read,
    @Default("")String replyText,
    @Default(-1)int replyIndex,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
