import 'package:flutter/material.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message
                  .formattedTimestamp, // Asegúrate de que 'message' tenga una propiedad 'time'
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 5), // Espacio entre la hora y las palomitas
            const Icon(
              Icons.done_all,
              size: 16,
              color: Colors.blue, // Color de las palomitas (azul para "visto")
            ),
          ],
        ),
      ],
    );
  }
}
