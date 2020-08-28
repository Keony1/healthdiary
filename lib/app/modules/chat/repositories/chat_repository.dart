import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/chat_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:healthdiary/app/modules/chat/errors/errors.dart';

@Injectable()
class ChatRepository implements IChatRepository {
  final Firestore firestore;

  ChatRepository({this.firestore});

  Either<FailureChat, Stream<QuerySnapshot>> getStreamComments(String mealId) {
    print('00alou');
    final response = firestore
        .collection('meals')
        .document(mealId)
        .collection("comments")
        .orderBy('time', descending: true)
        .snapshots();

    if (response == null) {
      return Left(InvalidReturnError());
    }

    return Right(response);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
