import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  @override
  Future getLoginWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result != null) {
        return _firestore
            .collection("users")
            .document(result.user.uid)
            .get()
            .then((doc) {
          if (doc.data != null) {
            return doc.data;
          } else {
            return null;
          }
        }).catchError((e) {
          return null;
        });
      }
    } catch (err) {
      return null;
    }

    return null;
  }

  @override
  Future<Map> getUser() async {
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
}
