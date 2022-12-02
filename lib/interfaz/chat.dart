import 'package:chat_mintic_g1/dev/autenticacion.dart';
import 'package:chat_mintic_g1/interfaz/msgs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final msg = TextEditingController();
final fireBF = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text((Autenticacion().users?.email).toString()),
          VerticalDivider(),
          IconButton(
              onPressed: () {
                Autenticacion().LoginOff();
              },
              icon: Icon(Icons.logout))
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Expanded(child: msgs()),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(hintText: "Mensaje:"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (msg.text.isNotEmpty) {
                        // creo esta variable para poder eliminar los espacios
                        //extra al inicio y al final del string
                        String strMsg = (msg.text).trim();

                        // con esta condicion puedo validar si el msg solo
                        //contenia espacios en blanco
                        if (strMsg.isNotEmpty) {
                          fireBF.collection("Chat").doc().set({
                            "mensaje": msg.text,
                            "tiempo": DateTime.now(),
                            "email": (Autenticacion().users?.email).toString()
                          });

                          msg.clear();
                        } else {
                          msg.clear();
                        }
                      }
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
