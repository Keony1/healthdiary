import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';

class UploadMealService extends Disposable {
  final MealsRepository mealsRepository;
  UploadMealService({this.mealsRepository});

  Future<bool> execute({@required Map data, String meal}) async {
    return await mealsRepository.uploadData(data: data, meal: meal);
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
