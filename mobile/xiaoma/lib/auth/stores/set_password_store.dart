import 'package:mobx/mobx.dart';

part 'set_password_store.g.dart';

class SetPasswordStore = _SetPasswordStore with _$SetPasswordStore;

abstract class _SetPasswordStore with Store {
  _SetPasswordStore();

  @observable
  bool showPassword = false;

  @action
  void handleShowPassword() {
    showPassword = !showPassword;
  }

  @observable
  bool showConfirmPassword = false;

  @action
  void handleShowConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
  }

  @observable
  String? password;

  @action
  void handlePassword({required String? value}) {
    password = value;
  }

  @observable
  String? confirmPassword;

  @action
  void handleConfirmPassword({required String? value}) {
    confirmPassword = value;
  }

  @computed
  bool get isCorrectPassword => password == confirmPassword;
}
