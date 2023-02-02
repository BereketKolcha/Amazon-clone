import 'package:amazon_clone/resources/cloudfirestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticationmethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signUpuser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";

    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        await cloudFirestoreClass.uploadNameAndAddress(
            name: name, address: address);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fillup all";
    }
    return output;
  }

  Future<String> signInuser({
    required String email,
    required String password,
  }) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";

    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fillup all";
    }
    return output;
  }
}
