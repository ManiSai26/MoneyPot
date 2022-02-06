import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String email;
  String? imageUrl;

  User( {
    required this.imageUrl,
    required this.userName,
    required this.email,
  });
  void writeToDatabase()
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection('Users').doc(userName).set(
      <String,dynamic>{
        'userName':userName,
        'email':email,
        'imageUrl':imageUrl
      }
    );
  }
}
