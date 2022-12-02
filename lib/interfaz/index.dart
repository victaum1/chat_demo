import 'package:chat_mintic_g1/dev/autenticacion.dart';
import 'package:chat_mintic_g1/interfaz/chat.dart';
import 'package:chat_mintic_g1/interfaz/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Chat G1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Autenticacion().loginActivo,
        builder: (context, answer) {
          if (answer.hasData) {
            return chat();
          } else {
            return login();
          }
        });
  }
}
