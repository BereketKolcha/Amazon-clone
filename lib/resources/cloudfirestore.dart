import 'package:amazon_clone/model/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddress({required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("user")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }
}
