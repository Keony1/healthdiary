import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/models/User.dart';

class GetAllUsersService extends Disposable {
  final AuthRepository authRepository;

  GetAllUsersService({this.authRepository});

  Future<List<User>> execute() async {
    QuerySnapshot qn = await authRepository.getDocumentsUser();

    List<User> users =
        qn.documents.map((user) => User.fromJson(user.data)).toList();

    return users;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
