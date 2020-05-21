import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  @override
  Future getLoginWithEmailAndPassword(String email, String password) async {
    Map user;

    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      user = await _firestore
          .collection("users")
          .document(result.user.uid)
          .get()
          .then((doc) {
        if (doc.data != null) {
          return doc.data;
        } else {
          return null;
        }
      });

      return user;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map> getCurrentUser() async {
    var userAuth = await _firebaseAuth.currentUser();

    return _firestore
        .collection('users')
        .document(userAuth.uid)
        .get()
        .then((doc) {
      return doc.data;
    });
  }

  @override
  Future getLogOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future checkAuthStatus() async {
    var currentUser = await FirebaseAuth.instance.currentUser();

    if (currentUser != null) {
      return currentUser;
    }

    return null;
  }

  @override
  Future getDocumentsUser() {
    try {
      Future<QuerySnapshot> usersDocuments =
          Firestore.instance.collection("users").getDocuments();

      return usersDocuments;
    } catch (e) {
      rethrow;
    }
  }
}
