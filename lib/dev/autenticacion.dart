import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fireBA = FirebaseAuth.instance;
  User? get users => fireBA.currentUser;
  Stream<User?> get loginActivo => fireBA.authStateChanges();
  Future<void> LoginOn({required String mail, required String psw}) async {
    try {
      await fireBA.signInWithEmailAndPassword(email: mail, password: psw);
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }

  Future<void> crearUser({required String mail, required String psw}) async {
    try {
      await fireBA.createUserWithEmailAndPassword(email: mail, password: psw);
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }

  Future<void> LoginOff() async {
    try {
      await fireBA.signOut();
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}
