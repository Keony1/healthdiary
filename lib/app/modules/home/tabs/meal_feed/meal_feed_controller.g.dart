// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealFeedController on _MealFeedControllerBase, Store {
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

  final _$loadMealsAsyncAction = AsyncAction('loadMeals');

  @override
  Future loadMeals() {
    return _$loadMealsAsyncAction.run(() => super.loadMeals());
  }

  @override
  String toString() {
    final string = 'mealsList: ${mealsList.toString()}';
    return '{$string}';
  }
}
