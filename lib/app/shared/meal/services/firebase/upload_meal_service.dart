import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';

class UploadMealService extends Disposable {
  final MealsRepository mealsRepository;
  UploadMealService({this.mealsRepository});

  Future<bool> execute({
    @required Map data,
  }) async {
    return await mealsRepository.uploadData(data: data);
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
