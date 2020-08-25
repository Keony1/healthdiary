import 'package:flutter_modular/flutter_modular.dart';

abstract class IRegisterRepository implements Disposable {
  Future fetchPost();
}
