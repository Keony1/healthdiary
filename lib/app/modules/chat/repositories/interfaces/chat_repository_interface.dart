import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dartz/dartz.dart';
import 'package:healthdiary/app/modules/chat/errors/errors.dart';

abstract class IChatRepository implements Disposable {
  Either<FailureChat, Stream<QuerySnapshot>> getStreamComments(String mealId);
}
