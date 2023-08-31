// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PromoCodeStore on _PromoCodeStore, Store {
  late final _$screenTitleAtom =
      Atom(name: '_PromoCodeStore.screenTitle', context: context);

  @override
  PromoCodeScreenTitles get screenTitle {
    _$screenTitleAtom.reportRead();
    return super.screenTitle;
  }

  @override
  set screenTitle(PromoCodeScreenTitles value) {
    _$screenTitleAtom.reportWrite(value, super.screenTitle, () {
      super.screenTitle = value;
    });
  }

  late final _$currentCodeIndexAtom =
      Atom(name: '_PromoCodeStore.currentCodeIndex', context: context);

  @override
  int? get currentCodeIndex {
    _$currentCodeIndexAtom.reportRead();
    return super.currentCodeIndex;
  }

  @override
  set currentCodeIndex(int? value) {
    _$currentCodeIndexAtom.reportWrite(value, super.currentCodeIndex, () {
      super.currentCodeIndex = value;
    });
  }

  late final _$_PromoCodeStoreActionController =
      ActionController(name: '_PromoCodeStore', context: context);

  @override
  void changeScreenTitle({required PromoCodeScreenTitles value}) {
    final _$actionInfo = _$_PromoCodeStoreActionController.startAction(
        name: '_PromoCodeStore.changeScreenTitle');
    try {
      return super.changeScreenTitle(value: value);
    } finally {
      _$_PromoCodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentCodeIndex({required int value}) {
    final _$actionInfo = _$_PromoCodeStoreActionController.startAction(
        name: '_PromoCodeStore.changeCurrentCodeIndex');
    try {
      return super.changeCurrentCodeIndex(value: value);
    } finally {
      _$_PromoCodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenTitle: ${screenTitle},
currentCodeIndex: ${currentCodeIndex}
    ''';
  }
}
