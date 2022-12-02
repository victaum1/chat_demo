import 'package:chat_mintic_g1/dev/autenticacion.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final mail = TextEditingController();
final psw = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sesión y registro")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu6fTqi6Rqjl0bUIEJijCOHcgpnuEHGuf8PA&usqp=CAU")),
            ),
            Divider(),
            TextField(
              controller: mail,
              decoration: InputDecoration(
                  hintText: "Email", suffixIcon: Icon(Icons.email)),
            ),
            TextField(
              obscureText: true,
              controller: psw,
              decoration: InputDecoration(
                  hintText: "Contraseña", suffixIcon: Icon(Icons.password)),
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().LoginOn(mail: mail.text, psw: psw.text);
                  mail.clear();
                  psw.clear();
                },
                icon: Icon(Icons.login),
                label: Text("Iniciar sesión")),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().crearUser(mail: mail.text, psw: psw.text);
                  mail.clear();
                  psw.clear();
                },
                icon: Icon(Icons.person_add),
                label: Text("Registrar usuario"))
          ],
        ),
      ),
    );
  }
}
