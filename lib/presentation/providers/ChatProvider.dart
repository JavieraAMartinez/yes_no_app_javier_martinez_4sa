import "package:flutter/material.dart";
import "package:yes_no_app_javier_martinez_4sa/config/helpers/get_yes_no_answer.dart";
import "package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola Ceci', fromWho: FromWho.me, timestamp: DateTime.now()),
    Message(
        text: '¿Ya eres Alcaldesa?',
        fromWho: FromWho.me,
        timestamp: DateTime.now())
  ];

  // Controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  // Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  // Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // No enviar el mensaje si está vacío
    if (text.isEmpty) {
      return;
    }
    // El mensaje siempre será "me" porque yo lo envío
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
      timestamp: DateTime.now(),
    );
    // Agregar el nuevo mensaje a la lista "messageList"
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    print("Cantidad de mensajes en la lista: ${messageList.length}");
    // Notificar cambios en el provider para actualizar la UI
    notifyListeners();

    // Mover el scroll al último mensaje
    moveScrollToBottom();
  }

  // Mover el scroll al último mensaje
  Future<void> moveScrollToBottom() async {
    //if (chatScrollController.hasClients) {
    // Un pequeño atraso en la animación para garantizar que siempre
    // se verá, aun cuando se envíen mensajes cortos y rápidos
    await Future.delayed(const Duration(milliseconds: 500));
    chatScrollController.animateTo(
      // Offset: Posición de la animación
      // maxScrollExtent determina a lo máximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent,
      // Duración en la animación
      duration: const Duration(milliseconds: 300),
      // "Rebote" al final de la animación
      curve: Curves.easeOut,
    );
    // }
  }

  // Responder automáticamente con un mensaje
  Future<void> herReply() async {
    // Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    // Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    // Notificar cambios en el provider para actualizar la UI
    notifyListeners();
    // Mover el scroll hasta el último mensaje recibido
    moveScrollToBottom();
  }
}
