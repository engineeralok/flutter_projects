
import 'package:chatter_flutter_chat_app/app.dart';
import 'package:chatter_flutter_chat_app/firebase_options.dart';
import 'package:chatter_flutter_chat_app/screens/screens.dart';
import 'package:chatter_flutter_chat_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final client = StreamChatClient(streamKey);

  runApp(
    MyApp(
      client: client,
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
    required this.appTheme,
  }) : super(key: key);

  final StreamChatClient client;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Chatter',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}
