import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/message.dart';
import './getDb.dart';

class MessageEvent {}

class newMessage extends MessageEvent {
  Message new_msg;
  newMessage({required this.new_msg});
}

class readMessage extends MessageEvent {
  String author;
  readMessage({required this.author});
}

class MessageBloc extends Bloc<MessageEvent,List<Message>> {
  MessageBloc() : super([]) {
    loadMessages().then((value) => emit(value));
    on<newMessage>(
        (event,emit) {
          saveMessages([...state,event.new_msg]);
          emit([...state,event.new_msg]);
        }
    );
    on<readMessage>(
        (event,emit){
          emit(
            state.map((msg){
              if(msg.author==event.author){
                return msg;
              }
              else{
                msg = msg.copyWith(read:true);
                return msg;
              }
            }).toList()
          );
        }
    );
  }
}