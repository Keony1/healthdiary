import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IMealsRepository {
  Future<QuerySnapshot> getFutureMeals();
  Stream<QuerySnapshot> getStreamMeals();
  Future<QuerySnapshot> getComments();
}
