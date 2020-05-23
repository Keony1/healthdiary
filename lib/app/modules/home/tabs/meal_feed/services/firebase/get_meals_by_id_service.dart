import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';

class GetMealByIdService extends Disposable {
  final MealsRepository mealsRepository;

  GetMealByIdService({this.mealsRepository});

  Future<List<Meal>> execute({@required String usuarioId}) async {
    QuerySnapshot mealDocuments =
        await mealsRepository.getMealsById(usuarioId: usuarioId);

    List<Meal> meals =
        mealDocuments.documents.map((doc) => Meal.fromJson(doc.data)).toList();

    return meals;
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
