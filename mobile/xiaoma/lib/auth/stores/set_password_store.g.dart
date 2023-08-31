// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetPasswordStore on _SetPasswordStore, Store {
  Computed<bool>? _$isCorrectPasswordComputed;

  @override
  bool get isCorrectPassword => (_$isCorrectPasswordComputed ??= Computed<bool>(
          () => super.isCorrectPassword,
          name: '_SetPasswordStore.isCorrectPassword'))
      .value;

  late final _$showPasswordAtom =
      Atom(name: '_SetPasswordStore.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$showConfirmPasswordAtom =
      Atom(name: '_SetPasswordStore.showConfirmPassword', context: context);

  @override
  bool get showConfirmPassword {
    _$showConfirmPasswordAtom.reportRead();
    return super.showConfirmPassword;
  }

  @override
  set showConfirmPassword(bool value) {
    _$showConfirmPasswordAtom.reportWrite(value, super.showConfirmPassword, () {
      super.showConfirmPassword = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SetPasswordStore.password', context: context);

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

  late final _$confirmPasswordAtom =
      Atom(name: '_SetPasswordStore.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$_SetPasswordStoreActionController =
      ActionController(name: '_SetPasswordStore', context: context);

  @override
  void handleShowPassword() {
    final _$actionInfo = _$_SetPasswordStoreActionController.startAction(
        name: '_SetPasswordStore.handleShowPassword');
    try {
      return super.handleShowPassword();
    } finally {
      _$_SetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleShowConfirmPassword() {
    final _$actionInfo = _$_SetPasswordStoreActionController.startAction(
        name: '_SetPasswordStore.handleShowConfirmPassword');
    try {
      return super.handleShowConfirmPassword();
    } finally {
      _$_SetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handlePassword({required String? value}) {
    final _$actionInfo = _$_SetPasswordStoreActionController.startAction(
        name: '_SetPasswordStore.handlePassword');
    try {
      return super.handlePassword(value: value);
    } finally {
      _$_SetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleConfirmPassword({required String? value}) {
    final _$actionInfo = _$_SetPasswordStoreActionController.startAction(
        name: '_SetPasswordStore.handleConfirmPassword');
    try {
      return super.handleConfirmPassword(value: value);
    } finally {
      _$_SetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
showConfirmPassword: ${showConfirmPassword},
password: ${password},
confirmPassword: ${confirmPassword},
isCorrectPassword: ${isCorrectPassword}
    ''';
  }
}
