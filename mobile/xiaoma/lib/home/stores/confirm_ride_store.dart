
import 'package:mobx/mobx.dart';

part 'confirm_ride_store.g.dart';

class ConfirmRideStore = _ConfirmRideStore with _$ConfirmRideStore;

abstract class _ConfirmRideStore with Store {
  @override
  DateTime startTime = DateTime.now();

  @action
  void changeStartTime({required DateTime value}){
    startTime = value;
  }
}