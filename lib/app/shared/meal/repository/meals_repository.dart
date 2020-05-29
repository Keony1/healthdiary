import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/interfaces/meals_repository_interface.dart';

class MealsRepository extends Disposable with IMealsRepository {
  final Firestore firestore;

  MealsRepository({this.firestore});

  @override
  Future<QuerySnapshot> getFutureMeals() {
    return firestore.collection("meals").orderBy('data').getDocuments();
  }

  @override
  Stream<QuerySnapshot> getStreamMeals() {
    return firestore.collection('meals').snapshots();
  }

  @override
  Future<QuerySnapshot> getComments({String documentId}) async {
    return await firestore
        .collection("meals")
        .document(documentId)
        .collection('comments')
        .getDocuments();
  }

  @override
  void dispose() {}

  @override
  Future<String> uploadImage({File image, String userUid}) async {
    StorageUploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child(userUid)
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(image);

    StorageTaskSnapshot s = await uploadTask.onComplete;
    String downloadUrl = await s.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<bool> uploadData({Map data}) async {
    try {
      await firestore.collection("meals").add(Map.from(data));
      return true;
    } catch (e) {
      return false;
    }
  }
}
