import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';

class GetMeals extends Disposable {
  final MealsRepository mealsRepository;

  GetMeals({this.mealsRepository});

  Future<List<Meal>> execute() async {
    QuerySnapshot mealDocuments = await mealsRepository.getFutureMeals();
    List<Comment> listComment;
    List<Meal> listMeals = List<Meal>();

    // var data = mealDocuments.documents.map((doc) async {
    //   final data = doc.data;

    //   QuerySnapshot comments =
    //       await mealsRepository.getComments(documentId: doc.documentID);

    //   if (comments.documents != null) {
    //     listComment = comments.documents
    //         .map((commentDoc) => Comment.fromJson(commentDoc.data))
    //         .toList();

    //     data['comments'] = listComment;
    //   }

    //   return Meal.fromJson(data);
    // }).toList();

    for (var doc in mealDocuments.documents) {
      final data = doc.data;
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
