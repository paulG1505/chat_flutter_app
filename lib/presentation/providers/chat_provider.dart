import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola Amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: 'No piciosito', fromWho: FromWho.hers),
  ];

//el future es como una promesa en js
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

  //saber si termina en ?
    if(text.endsWith('?')){
      herReply();
    }
    //se usa como un usestate para que actualice el estado
    notifyListeners();
    moveScrollToBottom();
  }

  //metodo para generar respuesta de ella con el api
  Future<void> herReply()async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  //para que se vaya al ultimo mensaje enviado
  Future<void> moveScrollToBottom() async {
    //que tome un tiempo para asegurar que haga animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController
            .position.maxScrollExtent, //MAXIMO QUE SE PUEDE DAR EL SCROLL
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
