import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/interfaces/meals_repository_interface.dart';

class MealsRepository extends Disposable with IMealsRepository {
  final Firestore firestore;

  MealsRepository({this.firestore});

  Future<QuerySnapshot> getMealsById({@required String usuarioId}) async {
    try {
      Future<QuerySnapshot> mealsSnapShot = firestore
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
