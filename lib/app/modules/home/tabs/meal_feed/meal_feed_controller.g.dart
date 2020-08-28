// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealFeedController on _MealFeedControllerBase, Store {
  final _$currentUserAtom = Atom(name: '_MealFeedControllerBase.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$cardListAtom = Atom(name: '_MealFeedControllerBase.cardList');

  @override
  ObservableList<dynamic> get cardList {
    _$cardListAtom.reportRead();
    return super.cardList;
  }

  @override
  set cardList(ObservableList<dynamic> value) {
    _$cardListAtom.reportWrite(value, super.cardList, () {
      super.cardList = value;
    });
  }

  final _$mealsListAtom = Atom(name: '_MealFeedControllerBase.mealsList');

  @override
  List<Meal> get mealsList {
    _$mealsListAtom.reportRead();
    return super.mealsList;
  }

  @override
  set mealsList(List<Meal> value) {
    _$mealsListAtom.reportWrite(value, super.mealsList, () {
      super.mealsList = value;
    });
  }

  final _$updatedAtom = Atom(name: '_MealFeedControllerBase.updated');

  @override
  bool get updated {
    _$updatedAtom.reportRead();
    return super.updated;
  }

  @override
  set updated(bool value) {
    _$updatedAtom.reportWrite(value, super.updated, () {
      super.updated = value;
    });
  }

  final _$reativeMealsListAtom =
      Atom(name: '_MealFeedControllerBase.reativeMealsList');

  @override
  ObservableStream<List<Meal>> get reativeMealsList {
    _$reativeMealsListAtom.reportRead();
    return super.reativeMealsList;
  }

  @override
  set reativeMealsList(ObservableStream<List<Meal>> value) {
    _$reativeMealsListAtom.reportWrite(value, super.reativeMealsList, () {
      super.reativeMealsList = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_MealFeedControllerBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$saveRateAsyncAction = AsyncAction('_MealFeedControllerBase.saveRate');

  @override
  Future saveRate(int rating, String documentId) {
    return _$saveRateAsyncAction.run(() => super.saveRate(rating, documentId));
  }

  final _$loadMealsAsyncAction =
      AsyncAction('_MealFeedControllerBase.loadMeals');

  @override
  Future loadMeals() {
    return _$loadMealsAsyncAction.run(() => super.loadMeals());
  }

  final _$_MealFeedControllerBaseActionController =
      ActionController(name: '_MealFeedControllerBase');

  @override
  dynamic checkForUpdates() {
    final _$actionInfo = _$_MealFeedControllerBaseActionController.startAction(
        name: '_MealFeedControllerBase.checkForUpdates');
    try {
      return super.checkForUpdates();
    } finally {
      _$_MealFeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToCommentsPage(String mealId) {
    final _$actionInfo = _$_MealFeedControllerBaseActionController.startAction(
        name: '_MealFeedControllerBase.goToCommentsPage');
    try {
      return super.goToCommentsPage(mealId);
    } finally {
      _$_MealFeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
cardList: ${cardList},
mealsList: ${mealsList},
updated: ${updated},
reativeMealsList: ${reativeMealsList}
    ''';
  }
}
