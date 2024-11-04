import 'package:flutter/material.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // Alinear mis mensajes a la derecha
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        // Fondo de los mensajes
        Container(
          decoration: BoxDecoration(
              color: colors.primary,

              // Hacer redondos los mensajes
              borderRadius: BorderRadius.circular(20)),

          // Separación (más bien ajuste de posición) de los mensajes
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            // Texto de los mensajes
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Separación de mensajes
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
