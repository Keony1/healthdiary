import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/shared/auth/repositories/interface/auth_repository_interface.dart';
import 'package:healthdiary/app/shared/models/User.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;
  final Firestore firestore;

  AuthRepository({this.firebaseAuth, this.firestore});

  @override
  Future<User> getLoginWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await firestore
          .collection("users")
          .document(result.user.uid)
          .get()
          .then((doc) {
        if (doc.data != null) {
          print(doc.data);
          return User.fromJson(doc.data);
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
  Future<User> getCurrentUser() async {
    var userAuth = await firebaseAuth.currentUser();

    return firestore
        .collection('users')
        .document(userAuth.uid)
        .get()
        .then((doc) {
      return User.fromJson(doc.data);
    });
  }

  @override
  Future getLogOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future checkAuthStatus() async {
    var currentUser = await firebaseAuth.currentUser();

    if (currentUser != null) {
      return currentUser;
    }

    return null;
  }

  @override
  Future<QuerySnapshot> getDocumentsUser() async {
    try {
      QuerySnapshot usersDocuments =
          await firestore.collection("users").getDocuments();

      return usersDocuments;
    } catch (e) {
      rethrow;
    }
  }
}
