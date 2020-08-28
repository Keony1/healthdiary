import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/chat_repository_interface.dart';

@Injectable()
class ChatRepository implements IChatRepository {
  final Firestore firestore;

  ChatRepository({this.firestore});

  Stream<QuerySnapshot> getStreamComments(String id) {
    final response = firestore
        .collection('meals')
        .document(id)
        .collection("comments")
        .orderBy('time', descending: true)
        .snapshots();

    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
