import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class IMealsRepository {
  Future<QuerySnapshot> getMealsById({@required String usuarioId});
}
