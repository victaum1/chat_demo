import 'package:chat_mintic_g1/dev/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class msgs extends StatefulWidget {
  const msgs({super.key});

  @override
  State<msgs> createState() => _msgsState();
}

class _msgsState extends State<msgs> {
  Stream<QuerySnapshot> respQuery = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: respQuery,
        builder: (context, AsyncSnapshot<QuerySnapshot> answerQuery) {
          return ListView.builder(
            itemCount: answerQuery.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (Autenticacion().users?.email).toString() ==
                        answerQuery.data!.docs[index].get("email")
                    ? Colors.green[100]
                    : Colors.blueGrey[50],
                child: ListTile(
                  title: Text(
                    answerQuery.data!.docs[index].get("mensaje"),
                    //uso un condicional dentro del wit de flutter
                    textAlign: (Autenticacion().users?.email).toString() ==
                            answerQuery.data!.docs[index].get("email")
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                  subtitle: Text(
                    answerQuery.data!.docs[index].get("email"),
                    //uso un condicional dentro del wit de flutter
                    textAlign: (Autenticacion().users?.email).toString() ==
                            answerQuery.data!.docs[index].get("email")
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                ),
              );
            },
          );
        });
  }
}
