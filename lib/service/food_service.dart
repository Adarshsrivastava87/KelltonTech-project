import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../classes/food_class.dart';

class FoodDB {
  final FirebaseFirestore _firebaseFirestore1 = FirebaseFirestore.instance;

  Stream<List<Food>> getAllFood() {
    return _firebaseFirestore1.collection('food').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Food.fromSnapshot(doc)).toList();
    });
  }
}

class FoodService extends GetxController {
  final foods = <Food>[].obs;

  @override
  void onInit() {
    foods.bindStream(FoodDB().getAllFood());
    super.onInit();
  }
}
