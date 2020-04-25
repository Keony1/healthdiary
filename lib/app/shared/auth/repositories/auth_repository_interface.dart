import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future getLoginWithEmailAndPassword(String email, String password);
  Future<Map> getUser();
  Future getLogOut();
}
