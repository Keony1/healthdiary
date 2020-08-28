import 'package:healthdiary/app/modules/chat/services/get_comments_service.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dartz/dartz.dart';

part 'chat_controller.g.dart';

@Injectable()
class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final GetCommentsService getCommentsService;

  @observable
  ObservableStream<List<Comment>> commentsSnapshots;

  _ChatControllerBase({this.getCommentsService});

  @action
  void getCommentsSnapshots(String mealId) {
    var result = getCommentsService.call(mealId);

    result.fold((l) => left(l), (r) => commentsSnapshots = r.asObservable());
  }
}
