import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/chat/errors/errors.dart';
import 'package:healthdiary/app/modules/chat/repositories/chat_repository.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:dartz/dartz.dart';

mixin IGetCommentsService {
  Either<FailureChat, Stream<List<Comment>>> call(String mealId);
}

@Injectable(singleton: false)
class GetCommentsService implements IGetCommentsService {
  final ChatRepository chatRepository;

  GetCommentsService({this.chatRepository});

  Either<FailureChat, Stream<List<Comment>>> call(String mealId) {
    var option = optionOf(mealId);

    return option.fold(() => Left(InvalidTextError()), (text) {
      var result = chatRepository.getStreamComments(mealId);

      return result.fold((l) => left(l), (r) {
        var listFromQuerySnapShot = getListFromQuerySnapShot(r);
        return right(listFromQuerySnapShot);
      });
    });
  }

  Stream<List<Comment>> getListFromQuerySnapShot(
      Stream<QuerySnapshot> commentsStream) {
    return commentsStream.map((query) {
      return query.documents.map((doc) {
        return Comment.fromJson(doc.data);
      }).toList();
    });
  }

  @override
  void dispose() {}
}
