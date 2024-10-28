import "package:flutter/material.dart";
import "package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart";

class Chatprovider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola ader", fromWho: FromWho.me),
    Message(text: "Lloras porque reprobaste topicos", fromWho: FromWho.me)
  ];
  //controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  Future<void> sendMessage(String text) async {
    //el mensaje siempre va a ser "me" porque yo lo envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    //Notifica si algo de provider cambió para que se guarde en el estado

    notifyListeners();
    // Mueve el scroll hasta el final
    moveScroollToBottom();
  }

  //Mover el scroll al ultimo mensaje

  Future<void> moveScroollToBottom() async {
    //Un pequeño atraso en la animación para garantizar que siempre
    //se verá aún cuando se envien mensajes cortos y rapidos
    await Future.delayed(const Duration(seconds: 1));
    //offset: posición de la animación
    //maxScrollExtend determina a lo maximo que el scroll puede dar
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        //Rebote al final de la animación
        curve: Curves.easeOut);
  }
}
