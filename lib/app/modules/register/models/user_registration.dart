import 'package:healthdiary/app/shared/models/User.dart';

class UserRegistration extends User {
  String email;
  String password;

  UserRegistration(
      this.email, this.password, String nome, String dataNascimento)
      : super(nome: nome, dataNascimento: dataNascimento);
}
