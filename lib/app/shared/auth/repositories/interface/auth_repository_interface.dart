import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAuthRepository {
  Future getLoginWithEmailAndPassword(String email, String password);
  Future<Map> getCurrentUser();
  Future getLogOut();
  Future checkAuthStatus();
  Future<QuerySnapshot> getDocumentsUser();
}
