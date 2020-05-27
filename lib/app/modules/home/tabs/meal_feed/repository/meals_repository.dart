import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/interfaces/meals_repository_interface.dart';

class MealsRepository extends Disposable with IMealsRepository {
  final Firestore firestore;

  MealsRepository({this.firestore});

  @override
  Future<QuerySnapshot> getFutureMeals() {
    return firestore.collection("meals").orderBy('data').getDocuments();
  }

  @override
  Stream<QuerySnapshot> getStreamMeals() {
    return firestore.collection('meals').snapshots();
  }

  @override
  Future<QuerySnapshot> getComments({String documentId}) async {
    return await firestore
        .collection("meals")
        .document(documentId)
        .collection('comments')
        .getDocuments();
  }

  @override
  void dispose() {}
}
