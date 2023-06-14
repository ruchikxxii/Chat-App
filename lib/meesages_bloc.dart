import 'package:flutter_bloc/flutter_bloc.dart';

class Message {
  String msg;
  String author;
  DateTime time;
  bool read;
  Message({required this.msg,required this.author,required this.time,this.read=false});
}

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
    on<newMessage>(
        (event,emit) {
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
                msg.read = true;
                return msg;
              }
            }).toList()
          );
        }
    );
  }
}