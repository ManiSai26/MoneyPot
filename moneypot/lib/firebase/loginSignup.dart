import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:moneypot/models/models.dart' as models;

Future<String?> isValidUser(String uname, String password) async {
  // await Firebase.initializeApp();
  try {
//  await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: uname, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
  }
  return null;
}

Future<String?> createUser(String uname, String password,String email) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    return e.code;
  }

  return null;
}

Future<void> uploadImage(File img, models.User user) async {
  String name = img.path;
  late String url;
  double progress = 0.0;
  Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('ProfilePictures/${user.email}');
  UploadTask uploadTask = firebaseStorageRef.putFile(img);
  uploadTask.snapshotEvents.listen((event) {
    progress =
        ((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
                100)
            .roundToDouble();

    print(progress);
  });
  uploadTask.whenComplete(() async => {
        url= await uploadTask.snapshot.ref.getDownloadURL()},
      );
  user.imageUrl=url;
  user.writeToDatabase();
  FirebaseFirestore db= FirebaseFirestore.instance;
  db.collection('Users').doc(user.userName).update(
    <String,dynamic>{
      'imageUrl':user.imageUrl,
    }
  );
  // return url;
}
