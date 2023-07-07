import 'dart:convert';
import 'dart:io';
import '../models/message.dart';

import 'package:path_provider/path_provider.dart';

Future<File> _getLocalFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/messages.json');
}

void saveMessages(List<Message> messages) async {
  try {
    await _getLocalFile().then((file) {
      final jsonMessages = jsonEncode(messages.map((m) => m.toJson()).toList());
      file.writeAsString(jsonMessages);
    });
    print('Messages saved successfully.');
  } catch (e) {
    print('Error saving messages: $e');
  }
}

Future<List<Message>> loadMessages() async {
  try {
    final file = await _getLocalFile();
    final jsonMessages = await file.readAsString();
    final decodedMessages = jsonDecode(jsonMessages) as List<dynamic>;
    return decodedMessages.map((m) => Message.fromJson(m)).toList();
  } catch (e) {
    // If the file doesn't exist or there's an error, return an empty list.
    return [];
  }
}