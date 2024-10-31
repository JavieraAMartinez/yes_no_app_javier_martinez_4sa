import 'package:flutter/material.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading es el espacio que hay antes del título
        //se envuenle en padding para que se haga pequeño
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media1.tenor.com/m/9pu3srSwRWUAAAAd/cecilia-patron-cecilia-patron-laviada.gif'),
          ),
        ), //avatar circular
        title: const Text('Cecilia'),
        centerTitle: true, //para forzar centrar el texto
      ),
      body: _ChatView(),
    );
  }
}

// El body se trabaja aquí
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Mueve al 'Mundo' a una zona segura
      child: Padding(
        // Para que no estén pegados a los bordes
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Fondo del chat
            Expanded(
                // ListView dice cuantos elementos tengo y puede cambiar, por eso no es const
                child: ListView.builder(
              itemCount: 10,
              // Como va a construir cada elemento
              itemBuilder: (context, index) {
                // Indica cual es el elemento que está rendirizando en este momento
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),

            // Caja de texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
