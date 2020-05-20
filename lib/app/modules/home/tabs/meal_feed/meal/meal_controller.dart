import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/repository/meal_repository_interface.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:mobx/mobx.dart';

part 'meal_controller.g.dart';

class MealController = _MealControllerBase with _$MealController;

abstract class _MealControllerBase with Store {
  final IMealRepository _repository = Modular.get();

  @action
  Future<List<Meal>> getMeals(String usuarioId) async {
    QuerySnapshot mealDocuments = await _repository.getMeals(usuarioId);

    List<Meal> meals =
        mealDocuments.documents.map((doc) => Meal.fromJson(doc.data)).toList();

    print(meals);

    return meals;
  }
}
