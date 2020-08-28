import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IChatRepository implements Disposable {
  Stream<QuerySnapshot> getStreamComments(String id);
}
