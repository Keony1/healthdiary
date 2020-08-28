// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMealController on _AddMealControllerBase, Store {
  Computed<bool> _$isLegendValidComputed;

  @override
  bool get isLegendValid =>
      (_$isLegendValidComputed ??= Computed<bool>(() => super.isLegendValid,
              name: '_AddMealControllerBase.isLegendValid'))
          .value;
  Computed<bool> _$isInputLegendTappedComputed;

  @override
  bool get isInputLegendTapped => (_$isInputLegendTappedComputed ??=
          Computed<bool>(() => super.isInputLegendTapped,
              name: '_AddMealControllerBase.isInputLegendTapped'))
      .value;
  Computed<String> _$errorLegendComputed;

  @override
  String get errorLegend =>
      (_$errorLegendComputed ??= Computed<String>(() => super.errorLegend,
              name: '_AddMealControllerBase.errorLegend'))
          .value;

  final _$legendAtom = Atom(name: '_AddMealControllerBase.legend');

  @override
  String get legend {
    _$legendAtom.reportRead();
    return super.legend;
  }

  @override
  set legend(String value) {
    _$legendAtom.reportWrite(value, super.legend, () {
      super.legend = value;
    });
  }

  final _$dropdownValueAtom =
      Atom(name: '_AddMealControllerBase.dropdownValue');

  @override
  String get dropdownValue {
    _$dropdownValueAtom.reportRead();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String value) {
    _$dropdownValueAtom.reportWrite(value, super.dropdownValue, () {
      super.dropdownValue = value;
    });
  }

  final _$checkedValueAtom = Atom(name: '_AddMealControllerBase.checkedValue');

  @override
  bool get checkedValue {
    _$checkedValueAtom.reportRead();
    return super.checkedValue;
  }

  @override
  set checkedValue(bool value) {
    _$checkedValueAtom.reportWrite(value, super.checkedValue, () {
      super.checkedValue = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AddMealControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$imageAtom = Atom(name: '_AddMealControllerBase.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$inputLegendTappedAtom =
      Atom(name: '_AddMealControllerBase.inputLegendTapped');

  @override
  bool get inputLegendTapped {
    _$inputLegendTappedAtom.reportRead();
    return super.inputLegendTapped;
  }

  @override
  set inputLegendTapped(bool value) {
    _$inputLegendTappedAtom.reportWrite(value, super.inputLegendTapped, () {
      super.inputLegendTapped = value;
    });
  }

  final _$sendMealAsyncAction = AsyncAction('_AddMealControllerBase.sendMeal');

  @override
  Future sendMeal() {
    return _$sendMealAsyncAction.run(() => super.sendMeal());
  }

  final _$_AddMealControllerBaseActionController =
      ActionController(name: '_AddMealControllerBase');

  @override
  void setOnTapLegend() {
    final _$actionInfo = _$_AddMealControllerBaseActionController.startAction(
        name: '_AddMealControllerBase.setOnTapLegend');
    try {
      return super.setOnTapLegend();
    } finally {
      _$_AddMealControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLegend(String value) {
    final _$actionInfo = _$_AddMealControllerBaseActionController.startAction(
        name: '_AddMealControllerBase.setLegend');
    try {
      return super.setLegend(value);
    } finally {
      _$_AddMealControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
legend: ${legend},
dropdownValue: ${dropdownValue},
checkedValue: ${checkedValue},
loading: ${loading},
image: ${image},
inputLegendTapped: ${inputLegendTapped},
isLegendValid: ${isLegendValid},
isInputLegendTapped: ${isInputLegendTapped},
errorLegend: ${errorLegend}
    ''';
  }
}
