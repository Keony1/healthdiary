import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';

class UploadMealImageService extends Disposable {
  final MealsRepository mealsRepository;
  UploadMealImageService({this.mealsRepository});

  Future<String> execute({
    @required File file,
    @required String userUid,
  }) async {
    // print('cuazoa');
    return await mealsRepository.uploadImage(image: file, userUid: userUid);
  }

  //dispose will be called automatically

  @override
  void dispose() {}
}
