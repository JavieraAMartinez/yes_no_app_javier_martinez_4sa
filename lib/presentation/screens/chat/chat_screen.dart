import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_javier_martinez_4sa/domain/entities/message.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/providers/ChatProvider.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fmid7-1.fna.fbcdn.net/v/t39.30808-6/457879035_1063871048430732_2166678086760807546_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=lV1ZabmZu84Q7kNvgGH4hZq&_nc_zt=23&_nc_ht=scontent.fmid7-1.fna&_nc_gid=A26eT-hGe1TwaeJFzbwgW-Z&oh=00_AYAcJZmeqEpZKtQgBio-xP1VPsIDiX1oVImeb9PTpkEU2Q&oe=673B0F73'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cecilia',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'En linea',
              style: TextStyle(fontSize: 12, color: Colors.green),
            )
          ],
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      // Instancia del message qy¿ue sabra de quien es el mensaje
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    })),

            // Caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
