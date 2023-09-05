// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenStore on _LoginScreenStore, Store {
  late final _$phoneNumberAtom =
      Atom(name: '_LoginScreenStore.phoneNumber', context: context);

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginScreenStore.password', context: context);

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
      Atom(name: '_LoginScreenStore.obscureText', context: context);

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

  late final _$isAuthenticatingAtom =
      Atom(name: '_LoginScreenStore.isAuthenticating', context: context);

  @override
  bool get isAuthenticating {
    _$isAuthenticatingAtom.reportRead();
    return super.isAuthenticating;
  }

  @override
  set isAuthenticating(bool value) {
    _$isAuthenticatingAtom.reportWrite(value, super.isAuthenticating, () {
      super.isAuthenticating = value;
    });
  }

  late final _$phoneNumberIsValidAtom =
      Atom(name: '_LoginScreenStore.phoneNumberIsValid', context: context);

  @override
  bool get phoneNumberIsValid {
    _$phoneNumberIsValidAtom.reportRead();
    return super.phoneNumberIsValid;
  }

  @override
  set phoneNumberIsValid(bool value) {
    _$phoneNumberIsValidAtom.reportWrite(value, super.phoneNumberIsValid, () {
      super.phoneNumberIsValid = value;
    });
  }

  late final _$isAuthenticatedAtom =
      Atom(name: '_LoginScreenStore.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$numberErrorMessageAtom =
      Atom(name: '_LoginScreenStore.numberErrorMessage', context: context);

  @override
  String get numberErrorMessage {
    _$numberErrorMessageAtom.reportRead();
    return super.numberErrorMessage;
  }

  @override
  set numberErrorMessage(String value) {
    _$numberErrorMessageAtom.reportWrite(value, super.numberErrorMessage, () {
      super.numberErrorMessage = value;
    });
  }

  late final _$passwordErrorMessageAtom =
      Atom(name: '_LoginScreenStore.passwordErrorMessage', context: context);

  @override
  String get passwordErrorMessage {
    _$passwordErrorMessageAtom.reportRead();
    return super.passwordErrorMessage;
  }

  @override
  set passwordErrorMessage(String value) {
    _$passwordErrorMessageAtom.reportWrite(value, super.passwordErrorMessage,
        () {
      super.passwordErrorMessage = value;
    });
  }

  late final _$validatePhoneNumberAsyncAction =
      AsyncAction('_LoginScreenStore.validatePhoneNumber', context: context);

  @override
  Future<dynamic> validatePhoneNumber(String? value) {
    return _$validatePhoneNumberAsyncAction
        .run(() => super.validatePhoneNumber(value));
  }

  late final _$validatePasswordAsyncAction =
      AsyncAction('_LoginScreenStore.validatePassword', context: context);

  @override
  Future<dynamic> validatePassword(String? value) {
    return _$validatePasswordAsyncAction
        .run(() => super.validatePassword(value));
  }

  late final _$_LoginScreenStoreActionController =
      ActionController(name: '_LoginScreenStore', context: context);

  @override
  void handleShowPassword() {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.handleShowPassword');
    try {
      return super.handleShowPassword();
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleIsAuthenticating({required bool? value}) {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.handleIsAuthenticating');
    try {
      return super.handleIsAuthenticating(value: value);
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
password: ${password},
obscureText: ${obscureText},
isAuthenticating: ${isAuthenticating},
phoneNumberIsValid: ${phoneNumberIsValid},
isAuthenticated: ${isAuthenticated},
numberErrorMessage: ${numberErrorMessage},
passwordErrorMessage: ${passwordErrorMessage}
    ''';
  }
}
