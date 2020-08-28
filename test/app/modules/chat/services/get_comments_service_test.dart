import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthdiary/app/modules/chat/repositories/chat_repository.dart';

import 'package:healthdiary/app/modules/chat/services/get_comments_service.dart';
import 'package:mockito/mockito.dart';

class ChatRepositoryMock extends Mock implements ChatRepository {}

void main() {
  GetCommentsService service;

  final repository = ChatRepositoryMock();

  setUp(() {
    service = GetCommentsService();
  });

  group('GetMessagesService Test', () {
    test('deve retornar uma lista com resultados', () {
      when(repository.getStreamComments("mealId"));

      var result = service.call("mealId");

      expect(result | null, isA<Stream<QuerySnapshot>>());
    });
  });
}
