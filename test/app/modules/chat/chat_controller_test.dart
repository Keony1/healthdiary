import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:healthdiary/app/modules/chat/chat_controller.dart';
import 'package:healthdiary/app/modules/chat/chat_module.dart';
import 'package:healthdiary/app/shared/models/Comment.dart';
import 'package:mobx/mobx.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(ChatModule());
  ChatController chat;
  setUp(() {
    chat = ChatModule.to.get<ChatController>();
  });

  group('ChatController Test', () {
    test("First Test", () {
      expect(chat, isInstanceOf<ChatController>());
    });

    test("should return exception", () {
      chat.getCommentsSnapshots("");
      expect(chat.commentsSnapshots, equals("ObservableStream<List<Comment>>"));
    });

    //   test("Set Value", () {
    //     expect(chat.value, equals(0));
    //     chat.increment();
    //     expect(chat.value, equals(1));
    //   });
  });
}
