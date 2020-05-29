import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/upload_meal_image_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/upload_meal_service.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:mobx/mobx.dart';

part 'add_meal_controller.g.dart';

class AddMealController = _AddMealControllerBase with _$AddMealController;

abstract class _AddMealControllerBase with Store {
  final GetCurrentUserService getCurrentUser;
  final UploadMealImageService uploadImageMeal;
  final UploadMealService uploadMeal;

  _AddMealControllerBase(
      {this.getCurrentUser, this.uploadImageMeal, this.uploadMeal});

  @observable
  String legend = "";

  @observable
  String dropdownValue = 'Café da manhã';

  @observable
  bool checkedValue = true;

  @observable
  bool loading = false;

  @observable
  File image;

  @observable
  bool inputLegendTapped = false;

  @computed
  bool get isLegendValid => legend.length > 0;

  @computed
  bool get isInputLegendTapped => inputLegendTapped ? true : false;

  @computed
  String get errorLegend => !isLegendValid && isInputLegendTapped
      ? 'O campo legenda precisa ser preenchido.'
      : null;

  @action
  void setOnTapLegend() {
    inputLegendTapped = true;
  }

  @action
  void setLegend(String value) {
    legend = value;
  }

  @action
  sendMeal() async {
    loading = true;

    if (isLegendValid) {
      User user = await getCurrentUser.execute();

      String imageUrl =
          await uploadImageMeal.execute(file: image, userUid: user.uid);
      List<String> dataImage = new List();

      dataImage.add(imageUrl);

      Map data = {
        'rated': false,
        'title': legend,
        'type': dropdownValue,
        'uid': user.uid,
        'images': dataImage,
        'data': DateTime.now()
      };

      bool savedData = await uploadMeal.execute(data: data);

      if (savedData) {
        Modular.to.pushReplacementNamed("/home");
      }
    } else {
      inputLegendTapped = true;

      loading = false;
    }
  }
}
