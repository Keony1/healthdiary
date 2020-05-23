import 'package:flutter/foundation.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_meals_by_id_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:mobx/mobx.dart';

part 'meal_feed_controller.g.dart';

class MealFeedController = _MealFeedControllerBase with _$MealFeedController;

abstract class _MealFeedControllerBase with Store {
  final GetMealByIdService getMealByIdService;
  final GetCurrentUserService getCurrentUserService;

  _MealFeedControllerBase(
      {@required this.getMealByIdService,
      @required this.getCurrentUserService}) {
    loadMeals();
  }

  @observable
  List<Meal> mealsList;

  @observable
  List<User> usersList;

  @observable
  User currentUser;

  @action
  loadMeals() async {
    currentUser = await getCurrentUserService.execute();

    await Future.delayed(
      Duration(milliseconds: 500),
    );

    mealsList = await getMealByIdService.execute(usuarioId: currentUser.uid);

    return mealsList;
  }
}
