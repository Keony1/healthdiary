import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/logout_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LogoutService logoutService;

  _HomeControllerBase({@required this.logoutService});

  @action
  logoff() async {
    await logoutService.execute();
    Modular.to.pushReplacementNamed("/");
  }

  @action
  pushToAddMealPage() async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1920,
      maxHeight: 1200,
      imageQuality: 80,
    );

    if (image != null) {
      Modular.to.pushReplacementNamed("/add_meal", arguments: image);
    }
  }
}
