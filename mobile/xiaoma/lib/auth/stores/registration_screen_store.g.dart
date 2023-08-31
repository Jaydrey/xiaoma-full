// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationScreenStore on _RegistrationScreenStore, Store {
  late final _$registrationModeAtom =
      Atom(name: '_RegistrationScreenStore.registrationMode', context: context);

  @override
  RegistrationMode get registrationMode {
    _$registrationModeAtom.reportRead();
    return super.registrationMode;
  }

  @override
  set registrationMode(RegistrationMode value) {
    _$registrationModeAtom.reportWrite(value, super.registrationMode, () {
      super.registrationMode = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_RegistrationScreenStore.fullName', context: context);

  @override
  String? get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String? value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegistrationScreenStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: '_RegistrationScreenStore.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$obscureConfirmPasswordAtom = Atom(
      name: '_RegistrationScreenStore.obscureConfirmPassword',
      context: context);

  @override
  String? get obscureConfirmPassword {
    _$obscureConfirmPasswordAtom.reportRead();
    return super.obscureConfirmPassword;
  }

  @override
  set obscureConfirmPassword(String? value) {
    _$obscureConfirmPasswordAtom
        .reportWrite(value, super.obscureConfirmPassword, () {
      super.obscureConfirmPassword = value;
    });
  }

  late final _$ObscureConfirmTextAtom = Atom(
      name: '_RegistrationScreenStore.ObscureConfirmText', context: context);

  @override
  bool get ObscureConfirmText {
    _$ObscureConfirmTextAtom.reportRead();
    return super.ObscureConfirmText;
  }

  @override
  set ObscureConfirmText(bool value) {
    _$ObscureConfirmTextAtom.reportWrite(value, super.ObscureConfirmText, () {
      super.ObscureConfirmText = value;
    });
  }

  late final _$isRegisteringAtom =
      Atom(name: '_RegistrationScreenStore.isRegistering', context: context);

  @override
  bool get isRegistering {
    _$isRegisteringAtom.reportRead();
    return super.isRegistering;
  }

  @override
  set isRegistering(bool value) {
    _$isRegisteringAtom.reportWrite(value, super.isRegistering, () {
      super.isRegistering = value;
    });
  }

  late final _$_RegistrationScreenStoreActionController =
      ActionController(name: '_RegistrationScreenStore', context: context);

  @override
  void handleRegistrationMode({required RegistrationMode value}) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
        name: '_RegistrationScreenStore.handleRegistrationMode');
    try {
      return super.handleRegistrationMode(value: value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleShowPassword() {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
        name: '_RegistrationScreenStore.handleShowPassword');
    try {
      return super.handleShowPassword();
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleShowConfirmPassword() {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
        name: '_RegistrationScreenStore.handleShowConfirmPassword');
    try {
      return super.handleShowConfirmPassword();
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleIsregistering({required bool value}) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
        name: '_RegistrationScreenStore.handleIsregistering');
    try {
      return super.handleIsregistering(value: value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
registrationMode: ${registrationMode},
fullName: ${fullName},
password: ${password},
obscureText: ${obscureText},
obscureConfirmPassword: ${obscureConfirmPassword},
ObscureConfirmText: ${ObscureConfirmText},
isRegistering: ${isRegistering}
    ''';
  }
}
