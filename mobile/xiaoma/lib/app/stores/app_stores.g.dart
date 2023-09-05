// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStores on _AppStores, Store {
  late final _$isOnBoardedAtom =
      Atom(name: '_AppStores.isOnBoarded', context: context);

  @override
  bool get isOnBoarded {
    _$isOnBoardedAtom.reportRead();
    return super.isOnBoarded;
  }

  @override
  set isOnBoarded(bool value) {
    _$isOnBoardedAtom.reportWrite(value, super.isOnBoarded, () {
      super.isOnBoarded = value;
    });
  }

  late final _$isAuthenticatedAtom =
      Atom(name: '_AppStores.isAuthenticated', context: context);

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

  late final _$_AppStoresActionController =
      ActionController(name: '_AppStores', context: context);

  @override
  void _getIsOnBoarded() {
    final _$actionInfo = _$_AppStoresActionController.startAction(
        name: '_AppStores._getIsOnBoarded');
    try {
      return super._getIsOnBoarded();
    } finally {
      _$_AppStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getAuthenticationStatus() {
    final _$actionInfo = _$_AppStoresActionController.startAction(
        name: '_AppStores._getAuthenticationStatus');
    try {
      return super._getAuthenticationStatus();
    } finally {
      _$_AppStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializeApp() {
    final _$actionInfo = _$_AppStoresActionController.startAction(
        name: '_AppStores.initializeApp');
    try {
      return super.initializeApp();
    } finally {
      _$_AppStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOnBoarded: ${isOnBoarded},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
