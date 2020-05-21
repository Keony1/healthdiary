import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/meal_controller.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:mobx/mobx.dart';

part 'meal_feed_controller.g.dart';

class MealFeedController = _MealFeedControllerBase with _$MealFeedController;

abstract class _MealFeedControllerBase with Store {
  MealController _meal = Modular.get();
  AuthController _auth = Modular.get();

  @observable
  List<Meal> mealsList;

  @observable
  List<User> usersList;

  @observable
  User currentUser;

  @action
  loadMeals() async {
    currentUser = await _auth.getUser();

    mealsList = await _meal.getMeals(currentUser.uid);
  }
}
