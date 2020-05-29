import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthdiary/app/shared/models/User.dart';

abstract class IAuthRepository {
  Future getLoginWithEmailAndPassword(String email, String password);
  Future<User> getCurrentUser();
  Future getLogOut();
  Future checkAuthStatus();
  Future<QuerySnapshot> getDocumentsUser();
}
