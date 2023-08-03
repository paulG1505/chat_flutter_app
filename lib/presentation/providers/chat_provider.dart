import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola Amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: 'No piciosito', fromWho: FromWho.hers),
  ];

//el future es como una promesa en js
  Future<void> sendMessage(String text) async {
    //TODO implementar metodo
  }
}
