// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealFeedController on _MealFeedControllerBase, Store {
  final _$usersListAtom = Atom(name: '_MealFeedControllerBase.usersList');

  @override
  List<User> get usersList {
    _$usersListAtom.context.enforceReadPolicy(_$usersListAtom);
    _$usersListAtom.reportObserved();
    return super.usersList;
  }

  @override
  set usersList(List<User> value) {
    _$usersListAtom.context.conditionallyRunInAction(() {
      super.usersList = value;
      _$usersListAtom.reportChanged();
    }, _$usersListAtom, name: '${_$usersListAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: '_MealFeedControllerBase.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$mealsListAtom = Atom(name: '_MealFeedControllerBase.mealsList');

  @override
  List<Meal> get mealsList {
    _$mealsListAtom.context.enforceReadPolicy(_$mealsListAtom);
    _$mealsListAtom.reportObserved();
    return super.mealsList;
  }

  @override
  set mealsList(List<Meal> value) {
    _$mealsListAtom.context.conditionallyRunInAction(() {
      super.mealsList = value;
      _$mealsListAtom.reportChanged();
    }, _$mealsListAtom, name: '${_$mealsListAtom.name}_set');
  }

  final _$reativeMealsListAtom =
      Atom(name: '_MealFeedControllerBase.reativeMealsList');

  @override
  ObservableStream<List<Meal>> get reativeMealsList {
    _$reativeMealsListAtom.context.enforceReadPolicy(_$reativeMealsListAtom);
    _$reativeMealsListAtom.reportObserved();
    return super.reativeMealsList;
  }

  @override
  set reativeMealsList(ObservableStream<List<Meal>> value) {
    _$reativeMealsListAtom.context.conditionallyRunInAction(() {
      super.reativeMealsList = value;
      _$reativeMealsListAtom.reportChanged();
    }, _$reativeMealsListAtom, name: '${_$reativeMealsListAtom.name}_set');
  }

  final _$loadMealsAsyncAction = AsyncAction('loadMeals');

  @override
  Future loadMeals() {
    return _$loadMealsAsyncAction.run(() => super.loadMeals());
  }

  @override
  String toString() {
    final string =
        'usersList: ${usersList.toString()},currentUser: ${currentUser.toString()},mealsList: ${mealsList.toString()},reativeMealsList: ${reativeMealsList.toString()}';
    return '{$string}';
  }
}
