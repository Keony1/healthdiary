import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/meal_controller.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:mobx/mobx.dart';

part 'meal_feed_controller.g.dart';

class MealFeedController = _MealFeedControllerBase with _$MealFeedController;

abstract class _MealFeedControllerBase with Store {
  MealController _meal = Modular.get();

  @action
  List<Meal> getMeals(usuarioId) {
    _meal.getMeals('X7zXITj7KZPe33Q6iEL3OKAzAIj1');
  }
}
