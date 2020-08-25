import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_all_users_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/get_meals_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/get_reative_meals_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/upload_meal_service.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:mobx/mobx.dart';

part 'meal_feed_controller.g.dart';

class MealFeedController = _MealFeedControllerBase with _$MealFeedController;

abstract class _MealFeedControllerBase with Store {
  final GetMealsService getMealsService;
  final GetCurrentUserService getCurrentUserService;
  final GetReativeMealsService getReativeMealsService;
  final GetAllUsersService getAllUsersService;
  final UploadMealService uploadMealService;

  _MealFeedControllerBase(
      {@required this.getMealsService,
      @required this.getCurrentUserService,
      @required this.getReativeMealsService,
      @required this.getAllUsersService,
      @required this.uploadMealService}) {
    getUser();
    loadMeals();
    checkForUpdates();
  }

  @observable
  User currentUser;

  @observable
  ObservableList cardList = ObservableList();

  @observable
  List<Meal> mealsList;

  @observable
  bool updated = false;

  @observable
  ObservableStream<List<Meal>> reativeMealsList;

  @action
  getUser() async {
    currentUser = await getCurrentUserService.execute();
  }

  @action
  checkForUpdates() {
    reativeMealsList = getReativeMealsService.execute().asObservable();
  }

  @action
  saveRate(int rating, String documentId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = rating;
    data['rated'] = true;
    data['nutriName'] = currentUser.nome;

    await uploadMealService.execute(data: data, meal: documentId);
    Modular.to.pushReplacementNamed(Modular.actualRoute);
  }

  @action
  loadMeals() async {
    List<User> usersList = await getAllUsersService.execute();
    mealsList = await getMealsService.execute();

    for (var meal in mealsList) {
      var mealJson = meal.toJson();

      for (var user in usersList) {
        if (user.uid == meal.uid) {
          mealJson['user'] = user.toJson();
        }
      }

      cardList.add(mealJson);
    }

    return cardList;
  }
}
