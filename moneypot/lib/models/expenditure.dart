import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Expenses {
 late double food,
      entertainment,
      bills,
      grocery,
      education,
      transport,
      others,
      total = 0;

  Expenses({
    required this.food,
    required this.entertainment,
    required this.bills,
    required this.grocery,
    required this.education,
    required this.transport,
    required this.others,
  });

  Expenses.ofString({
    required String food,
    required String entertainment,
    required String bills,
    required String grocery,
    required String education,
    required String transport,
    required String others,
  }) {
    this.food = double.tryParse(food)!;
    this.entertainment = double.tryParse(entertainment)!;
    this.bills = double.tryParse(bills)!;
    this.grocery = double.tryParse(grocery)!;
    this.education = double.tryParse(education)!;
    this.transport = double.tryParse(transport)!;
    this.others = double.tryParse(others)!;
    total=totalExpenditure();
  }

  double totalExpenditure() {
    total =
        food + entertainment + bills + grocery + education + transport + others;
    return total;
  }

  Future<void> writeToDatabase({
    required String Name,
    required DateTime time,
  }) async {
    // await Firebase.initializeApp();
    totalExpenditure();
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection(Name).doc(time.toString()).set(<String, dynamic>{
      'food': food,
      'entertainment': entertainment,
      'bills': bills,
      'grocery': grocery,
      'education': education,
      'transport': transport,
      'others': others,
      'total': total,
      'time': time.toString(),
    });
  }
  Future<Map<String, dynamic>?> getData({required String name,required String time})
  async {
     await Firebase.initializeApp();
    final  snapshot=await  FirebaseFirestore.instance.collection(name).doc(time).get();
    return await snapshot.data();
  }
}
