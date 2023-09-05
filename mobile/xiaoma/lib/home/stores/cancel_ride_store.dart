// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'cancel_ride_store.g.dart';

class CancelRideStore = _CancelRideStore with _$CancelRideStore;

abstract class _CancelRideStore with Store {
  _CancelRideStore();

  @observable
  Map<String, int> cancelRideReasons = {};

  @action
  void changeCancelRideReasons({
    required String reasonLabel,
    required int reasonIndex,
  }) {
    if (cancelRideReasons.keys.contains(reasonLabel)) {
      cancelRideReasons.remove(reasonLabel);
      return;
    }
    cancelRideReasons[reasonLabel] = reasonIndex;
  }

  @action
  bool isReason({required String reasonLabel}) {
    if (cancelRideReasons.keys.contains(reasonLabel)) {
      return true;
    }
    return false;
  }
}
