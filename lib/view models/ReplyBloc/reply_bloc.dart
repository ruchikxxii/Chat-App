import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reply_event.dart';
part 'reply_state.dart';

class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {
  ReplyBloc() : super(ReplyInitial()) {
    on<EnableReply>((event, emit) {
      emit(ReplyEnabled(replyText: event.replyText, replyIndex: event.replyIndex));
    });
    on<DisableReply>((event,emit) {
      emit(ReplyDisabled());
    });
  }
}
