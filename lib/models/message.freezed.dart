// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get msg => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String get replyText => throw _privateConstructorUsedError;
  int get replyIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String msg,
      String author,
      DateTime time,
      bool read,
      String replyText,
      int replyIndex});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? author = null,
    Object? time = null,
    Object? read = null,
    Object? replyText = null,
    Object? replyIndex = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      replyText: null == replyText
          ? _value.replyText
          : replyText // ignore: cast_nullable_to_non_nullable
              as String,
      replyIndex: null == replyIndex
          ? _value.replyIndex
          : replyIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String msg,
      String author,
      DateTime time,
      bool read,
      String replyText,
      int replyIndex});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? author = null,
    Object? time = null,
    Object? read = null,
    Object? replyText = null,
    Object? replyIndex = null,
  }) {
    return _then(_$_Message(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      replyText: null == replyText
          ? _value.replyText
          : replyText // ignore: cast_nullable_to_non_nullable
              as String,
      replyIndex: null == replyIndex
          ? _value.replyIndex
          : replyIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.msg,
      required this.author,
      required this.time,
      this.read = false,
      this.replyText = "",
      this.replyIndex = -1});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String msg;
  @override
  final String author;
  @override
  final DateTime time;
  @override
  @JsonKey()
  final bool read;
  @override
  @JsonKey()
  final String replyText;
  @override
  @JsonKey()
  final int replyIndex;

  @override
  String toString() {
    return 'Message(msg: $msg, author: $author, time: $time, read: $read, replyText: $replyText, replyIndex: $replyIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.replyText, replyText) ||
                other.replyText == replyText) &&
            (identical(other.replyIndex, replyIndex) ||
                other.replyIndex == replyIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, msg, author, time, read, replyText, replyIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String msg,
      required final String author,
      required final DateTime time,
      final bool read,
      final String replyText,
      final int replyIndex}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get msg;
  @override
  String get author;
  @override
  DateTime get time;
  @override
  bool get read;
  @override
  String get replyText;
  @override
  int get replyIndex;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
