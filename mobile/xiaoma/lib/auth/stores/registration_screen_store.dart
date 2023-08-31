import 'package:mobx/mobx.dart';

part 'registration_screen_store.g.dart';

class RegistrationScreenStore = _RegistrationScreenStore
    with _$RegistrationScreenStore;

abstract class _RegistrationScreenStore with Store {
  _RegistrationScreenStore();

  @observable
  RegistrationMode registrationMode = RegistrationMode.phoneNumber;

  @action
  void handleRegistrationMode({required RegistrationMode value}) {
    registrationMode = value;
  }

  @observable
  String? fullName;

  @observable
  String? password;

  @observable
  bool obscureText = true;

  @observable
  String? obscureConfirmPassword;

  @observable
  bool ObscureConfirmText = true;

  @action
  void handleShowPassword() {
    obscureText = !obscureText;
  }

  @action
  void handleShowConfirmPassword() {
    ObscureConfirmText = !ObscureConfirmText;
  }

  @observable
  bool isRegistering = false;

  @action
  void handleIsregistering({required bool value}) {
    isRegistering = value;
  }
}

enum RegistrationMode { phoneNumber, google }
