import 'package:cloud_firestore/cloud_firestore.dart';

import 'services/get_comments_service.dart';
import 'repositories/chat_repository.dart';
import 'chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ChatController(
            getCommentsService: GetCommentsService(
              chatRepository: ChatRepository(firestore: Firestore.instance),
            ),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ChatPage(
                  title: 'Mensagens',
                  mealId: args.data,
                )),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
