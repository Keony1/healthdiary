import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';

class GetReativeMealsService extends Disposable {
  final MealsRepository mealsRepository;
  GetReativeMealsService({this.mealsRepository});
  Stream<List<Meal>> hasUpdate;

  Stream<List<Meal>> execute() {
    return mealsRepository.getStreamMeals().map((query) {
      return query.documents.map((doc) {
        final data = doc.data;
        data['documentId'] = doc.documentID;
        return Meal.fromJson(data);
      }).toList();
    });
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
