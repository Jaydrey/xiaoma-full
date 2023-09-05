import 'package:mobx/mobx.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  _LoginScreenStore();

  @observable
  String? phoneNumber;

  @observable
  String? password;

  @observable
  bool obscureText = true;

  @action
  void handleShowPassword() {
    obscureText = !obscureText;
  }

  @observable
  bool isAuthenticating = false;

  @action
  void handleIsAuthenticating({required bool? value}) {
    isAuthenticating = value ?? false;
  }

  @observable
  bool phoneNumberIsValid = false;

  @observable
  bool isAuthenticated = false;

  @observable
  String numberErrorMessage = "";

  @observable
  String passwordErrorMessage = "";

  late List<ReactionDisposer> _disposers;

  void setUpValidations() {
    _disposers = [
      reaction((_) => phoneNumber, validatePhoneNumber),
      reaction((_) => password, validatePassword),
    ];
  }

  @action
  Future validatePhoneNumber(String? value) async {}

  @action
  Future validatePassword(String? value) async {}
}
