import 'package:healthdiary/app/modules/chat/services/get_comments_service.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    print(mealId);
    commentsSnapshots = getCommentsService.execute(mealId).asObservable();
  }
}
