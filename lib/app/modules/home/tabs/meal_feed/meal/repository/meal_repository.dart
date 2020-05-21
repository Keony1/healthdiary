import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/repository/meal_repository_interface.dart';

class MealRepository extends Disposable with IMealRepository {
  @override
  Future<QuerySnapshot> getMealsDocuments(String usuarioId) async {
    try {
      Future<QuerySnapshot> mealsSnapShot = Firestore.instance
          .collection("meals")
          .where("uid", isEqualTo: usuarioId)
          .getDocuments();

      return mealsSnapShot;
    } catch (e) {
      rethrow;
    }
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
