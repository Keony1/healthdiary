import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/register/repositories/register_repository.dart';
import 'package:healthdiary/app/modules/register/models/user_registration.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterRepository registerRepository;

  _RegisterControllerBase({this.registerRepository});

  @observable
  String error = "";

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String birthDate;

  @observable
  String password = "";

  @observable
  String passwordConfirmation = "";

  @action
  void setName(String value) {
    error = "";
    name = value;
  }

  @action
  void setEmail(String value) {
    error = "";
    email = value.trim();
  }

  @action
  void setBirthDate(String value) {
    error = "";
    birthDate = value;
  }

  @action
  void setPassword(String value) {
    error = "";
    password = value;
  }

  @action
  void setPasswordConfirmation(String value) {
    error = "";
    passwordConfirmation = value;
  }

  @computed
  String get errorName => name == null ? 'Digite seu nome' : null;

  @computed
  String get errorEmail =>
      email.length > 0 && email.length < 4 ? "Deve ser um e-mail válido" : null;

  @computed
  String get errorBirthDate => null;

  @computed
  String get errorMatchPassword =>
      password != passwordConfirmation ? 'Senhas não conferem!' : null;

  @computed
  bool get isNameValid => name != null;

  @computed
  bool get isEmailValid => email.length >= 3;

  @computed
  bool get isBirthDateValid => true;

  @computed
  bool get isPasswordValid =>
      password == passwordConfirmation && password.length >= 6;

  @computed
  bool get isFormValid =>
      isNameValid &&
      isEmailValid &&
      isBirthDateValid &&
      isPasswordValid &&
      error == '';

  @action
  Future register() async {
    try {
      UserRegistration user =
          UserRegistration(email, password, name, birthDate);
      await registerRepository.createUser(user);

      Modular.to.pushNamed('/login');
    } catch (exception) {
      switch (exception.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          error = 'E-mail já está em uso';
          break;
        default:
          error = 'Algo não está certo';
          break;
      }
      // error = exception;
    }
  }
}
