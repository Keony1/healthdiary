import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_meals.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_reative_meals.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:mobx/mobx.dart';

part 'meal_feed_controller.g.dart';

class MealFeedController = _MealFeedControllerBase with _$MealFeedController;

abstract class _MealFeedControllerBase with Store {
  final GetMeals getMeals;
  final GetCurrentUserService getCurrentUserService;
  final GetReativeMeals getReativeMeals;

  _MealFeedControllerBase({
    @required this.getMeals,
    @required this.getCurrentUserService,
    @required this.getReativeMeals,
  }) {
    loadMeals();
  }

  @observable
  List<User> usersList;

  @observable
  User currentUser;

  @observable
  List<Meal> mealsList;

  @observable
  ObservableStream<List<Meal>> reativeMealsList;

  @action
  loadMeals() async {
    reativeMealsList = getReativeMeals.execute().asObservable();

    mealsList = await getMeals.execute().asObservable();

    return reativeMealsList;
  }
}
