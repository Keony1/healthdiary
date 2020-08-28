// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealFeedController on _MealFeedControllerBase, Store {
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

  final _$cardListAtom = Atom(name: '_MealFeedControllerBase.cardList');

  @override
  ObservableList<dynamic> get cardList {
    _$cardListAtom.context.enforceReadPolicy(_$cardListAtom);
    _$cardListAtom.reportObserved();
    return super.cardList;
  }

  @override
  set cardList(ObservableList<dynamic> value) {
    _$cardListAtom.context.conditionallyRunInAction(() {
      super.cardList = value;
      _$cardListAtom.reportChanged();
    }, _$cardListAtom, name: '${_$cardListAtom.name}_set');
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

  final _$updatedAtom = Atom(name: '_MealFeedControllerBase.updated');

  @override
  bool get updated {
    _$updatedAtom.context.enforceReadPolicy(_$updatedAtom);
    _$updatedAtom.reportObserved();
    return super.updated;
  }

  @override
  set updated(bool value) {
    _$updatedAtom.context.conditionallyRunInAction(() {
      super.updated = value;
      _$updatedAtom.reportChanged();
    }, _$updatedAtom, name: '${_$updatedAtom.name}_set');
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

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$saveRateAsyncAction = AsyncAction('saveRate');

  @override
  Future saveRate(int rating, String documentId) {
    return _$saveRateAsyncAction.run(() => super.saveRate(rating, documentId));
  }

  final _$loadMealsAsyncAction = AsyncAction('loadMeals');

  @override
  Future loadMeals() {
    return _$loadMealsAsyncAction.run(() => super.loadMeals());
  }

  final _$_MealFeedControllerBaseActionController =
      ActionController(name: '_MealFeedControllerBase');

  @override
  dynamic checkForUpdates() {
    final _$actionInfo =
        _$_MealFeedControllerBaseActionController.startAction();
    try {
      return super.checkForUpdates();
    } finally {
      _$_MealFeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToCommentsPage(String mealId) {
    final _$actionInfo =
        _$_MealFeedControllerBaseActionController.startAction();
    try {
      return super.goToCommentsPage(mealId);
    } finally {
      _$_MealFeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentUser: ${currentUser.toString()},cardList: ${cardList.toString()},mealsList: ${mealsList.toString()},updated: ${updated.toString()},reativeMealsList: ${reativeMealsList.toString()}';
    return '{$string}';
  }
}
