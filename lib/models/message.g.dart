// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      msg: json['msg'] as String,
      author: json['author'] as String,
      time: DateTime.parse(json['time'] as String),
      read: json['read'] as bool? ?? false,
      replyText: json['replyText'] as String? ?? "",
      replyIndex: json['replyIndex'] as int? ?? -1,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'author': instance.author,
      'time': instance.time.toIso8601String(),
      'read': instance.read,
      'replyText': instance.replyText,
      'replyIndex': instance.replyIndex,
    };
