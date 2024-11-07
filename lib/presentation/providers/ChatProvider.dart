import "package:flutter/material.dart";
import "package:yes_no_app_javier_martinez_4sa/config/helpers/get_yes_no_answer.dart";
import "package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart";

class Chatprovider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola ader", fromWho: FromWho.me),
    Message(text: "Lloras porque reprobaste topicos", fromWho: FromWho.me)
  ];
  //controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();
  //el futur es una promesa
  Future<void> sendMessage(String text) async {
    if (text.trim().isNotEmpty) {
      //el mensaje siempre va a ser "me" porque yo lo envio
      final newMessage = Message(text: text, fromWho: FromWho.me);
      messageList.add(newMessage);
      if (text.endsWith("?")) {
        herReply();
      }

      //Notifica si algo de provider cambió para que se guarde en el estado

      notifyListeners();
      // Mueve el scroll hasta el final
      moveScroollToBottom();
    }
  }

  //Mover el scroll al ultimo mensaje

  Future<void> moveScroollToBottom() async {
    if (chatScrollController.hasClients) {
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

  Future<void> herReply() async {
    //obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    //Notifica si algo de provider cambio para el estado
    notifyListeners();
    //Mueve el scroll hasta el ultimo mensaje recibido
    moveScroollToBottom();
  }
}
