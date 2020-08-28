import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/chat/repositories/chat_repository.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';

@Injectable()
class GetCommentsService extends Disposable {
  final ChatRepository chatRepository;

  GetCommentsService({this.chatRepository});

  Stream<List<Comment>> execute(String id) {
    return chatRepository.getStreamComments(id).map((query) {
      return query.documents.map((doc) {
        return Comment.fromJson(doc.data);
      }).toList();
    });
  }

  @override
  void dispose() {}
}
