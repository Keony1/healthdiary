import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';

class GetReativeMeals extends Disposable {
  final MealsRepository mealsRepository;
  GetReativeMeals({this.mealsRepository});
  Stream<List<Meal>> hasUpdate;

  Stream<List<Meal>> execute() {
    return mealsRepository.getStreamMeals().map((query) {
      return query.documents.map((doc) {
        return Meal.fromJson(doc.data);
      }).toList();
    });
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
