// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_ride_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CancelRideStore on _CancelRideStore, Store {
  late final _$cancelRideReasonsAtom =
      Atom(name: '_CancelRideStore.cancelRideReasons', context: context);

  @override
  Map<String, int> get cancelRideReasons {
    _$cancelRideReasonsAtom.reportRead();
    return super.cancelRideReasons;
  }

  @override
  set cancelRideReasons(Map<String, int> value) {
    _$cancelRideReasonsAtom.reportWrite(value, super.cancelRideReasons, () {
      super.cancelRideReasons = value;
    });
  }

  late final _$_CancelRideStoreActionController =
      ActionController(name: '_CancelRideStore', context: context);

  @override
  void changeCancelRideReasons(
      {required String reasonLabel, required int reasonIndex}) {
    final _$actionInfo = _$_CancelRideStoreActionController.startAction(
        name: '_CancelRideStore.changeCancelRideReasons');
    try {
      return super.changeCancelRideReasons(
          reasonLabel: reasonLabel, reasonIndex: reasonIndex);
    } finally {
      _$_CancelRideStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isReason({required String reasonLabel}) {
    final _$actionInfo = _$_CancelRideStoreActionController.startAction(
        name: '_CancelRideStore.isReason');
    try {
      return super.isReason(reasonLabel: reasonLabel);
    } finally {
      _$_CancelRideStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cancelRideReasons: ${cancelRideReasons}
    ''';
  }
}
