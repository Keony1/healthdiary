// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMealController on _AddMealControllerBase, Store {
  Computed<bool> _$isLegendValidComputed;

  @override
  bool get isLegendValid =>
      (_$isLegendValidComputed ??= Computed<bool>(() => super.isLegendValid))
          .value;
  Computed<bool> _$isInputLegendTappedComputed;

  @override
  bool get isInputLegendTapped => (_$isInputLegendTappedComputed ??=
          Computed<bool>(() => super.isInputLegendTapped))
      .value;
  Computed<String> _$errorLegendComputed;

  @override
  String get errorLegend =>
      (_$errorLegendComputed ??= Computed<String>(() => super.errorLegend))
          .value;

  final _$legendAtom = Atom(name: '_AddMealControllerBase.legend');

  @override
  String get legend {
    _$legendAtom.context.enforceReadPolicy(_$legendAtom);
    _$legendAtom.reportObserved();
    return super.legend;
  }

  @override
  set legend(String value) {
    _$legendAtom.context.conditionallyRunInAction(() {
      super.legend = value;
      _$legendAtom.reportChanged();
    }, _$legendAtom, name: '${_$legendAtom.name}_set');
  }

  final _$dropdownValueAtom =
      Atom(name: '_AddMealControllerBase.dropdownValue');

  @override
  String get dropdownValue {
    _$dropdownValueAtom.context.enforceReadPolicy(_$dropdownValueAtom);
    _$dropdownValueAtom.reportObserved();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String value) {
    _$dropdownValueAtom.context.conditionallyRunInAction(() {
      super.dropdownValue = value;
      _$dropdownValueAtom.reportChanged();
    }, _$dropdownValueAtom, name: '${_$dropdownValueAtom.name}_set');
  }

  final _$checkedValueAtom = Atom(name: '_AddMealControllerBase.checkedValue');

  @override
  bool get checkedValue {
    _$checkedValueAtom.context.enforceReadPolicy(_$checkedValueAtom);
    _$checkedValueAtom.reportObserved();
    return super.checkedValue;
  }

  @override
  set checkedValue(bool value) {
    _$checkedValueAtom.context.conditionallyRunInAction(() {
      super.checkedValue = value;
      _$checkedValueAtom.reportChanged();
    }, _$checkedValueAtom, name: '${_$checkedValueAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_AddMealControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$imageAtom = Atom(name: '_AddMealControllerBase.image');

  @override
  File get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$inputLegendTappedAtom =
      Atom(name: '_AddMealControllerBase.inputLegendTapped');

  @override
  bool get inputLegendTapped {
    _$inputLegendTappedAtom.context.enforceReadPolicy(_$inputLegendTappedAtom);
    _$inputLegendTappedAtom.reportObserved();
    return super.inputLegendTapped;
  }

  @override
  set inputLegendTapped(bool value) {
    _$inputLegendTappedAtom.context.conditionallyRunInAction(() {
      super.inputLegendTapped = value;
      _$inputLegendTappedAtom.reportChanged();
    }, _$inputLegendTappedAtom, name: '${_$inputLegendTappedAtom.name}_set');
  }

  final _$sendMealAsyncAction = AsyncAction('sendMeal');

  @override
  Future sendMeal() {
    return _$sendMealAsyncAction.run(() => super.sendMeal());
  }

  final _$_AddMealControllerBaseActionController =
      ActionController(name: '_AddMealControllerBase');

  @override
  void setOnTapLegend() {
    final _$actionInfo = _$_AddMealControllerBaseActionController.startAction();
    try {
      return super.setOnTapLegend();
    } finally {
      _$_AddMealControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLegend(String value) {
    final _$actionInfo = _$_AddMealControllerBaseActionController.startAction();
    try {
      return super.setLegend(value);
    } finally {
      _$_AddMealControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'legend: ${legend.toString()},dropdownValue: ${dropdownValue.toString()},checkedValue: ${checkedValue.toString()},loading: ${loading.toString()},image: ${image.toString()},inputLegendTapped: ${inputLegendTapped.toString()},isLegendValid: ${isLegendValid.toString()},isInputLegendTapped: ${isInputLegendTapped.toString()},errorLegend: ${errorLegend.toString()}';
    return '{$string}';
  }
}
