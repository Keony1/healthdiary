import 'package:mobx/mobx.dart';

part 'add_meal_controller.g.dart';

class AddMealController = _AddMealControllerBase with _$AddMealController;

abstract class _AddMealControllerBase with Store {
  @observable
  int value = 0;

  @observable
  String legend = "";

  @action
  void setLegend(String value) {
    legend = value;
  }

  @computed
  bool get isLegendValid => legend.length > 1;

  @computed
  String get errorLegend =>
      !isLegendValid ? "Sua senha deve ser maior que 3 caracteres" : null;

  @action
  void increment() {
    value++;
  }
}
