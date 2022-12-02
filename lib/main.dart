import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'interfaz/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAs0m-c_i020ZZG2SK15O6OlEeG1dJXUME",
          authDomain: "reto3-chat-8b850.firebaseapp.com",
          projectId: "reto3-chat-8b850",
          storageBucket: "reto3-chat-8b850.appspot.com",
          messagingSenderId: "896183001464",
          appId: "1:896183001464:web:82219bd88aa7bd09ebe88d",
          measurementId: "G-51X7JTLL2Y"));
  runApp(const MyApp());
}
