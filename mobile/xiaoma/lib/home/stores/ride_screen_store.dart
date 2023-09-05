import 'package:mobx/mobx.dart';

part 'ride_screen_store.g.dart';

class RideScreenStore = _RideScreenStore with _$RideScreenStore;

abstract class _RideScreenStore with Store {
  @observable
  bool isLoading = false;
}
