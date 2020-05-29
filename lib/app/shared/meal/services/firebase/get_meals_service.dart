import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';

class GetMealsService extends Disposable {
  final MealsRepository mealsRepository;

  GetMealsService({this.mealsRepository});

  Future<List<Meal>> execute() async {
    QuerySnapshot mealDocuments = await mealsRepository.getFutureMeals();
    List<Comment> listComment;
    List<Meal> listMeals = List<Meal>();
    var documentsReversed = mealDocuments.documents.reversed;

    for (var doc in documentsReversed) {
      final data = doc.data;

      data['documentId'] = doc.documentID;

      QuerySnapshot comments =
          await mealsRepository.getComments(documentId: doc.documentID);

      if (comments.documents != null) {
        listComment = comments.documents
            .map((commentDoc) => Comment.fromJson(commentDoc.data))
            .toList();

        data['comments'] = listComment;
      }

      listMeals.add(Meal.fromJson(data));
    }

    return listMeals;
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
