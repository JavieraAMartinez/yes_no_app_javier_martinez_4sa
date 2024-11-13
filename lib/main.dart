import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_javier_martinez_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/providers/ChatProvider.dart';
import 'package:yes_no_app_javier_martinez_4sa/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          // Desde aquí puedo redireccionar lo valores de colores en app theme
          theme: AppTheme(selectedColor: 0).theme(),
          home: const ChatScreen()),
    );
  }
}
