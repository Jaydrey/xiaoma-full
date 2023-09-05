// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:mobx/mobx.dart';
import 'package:xiaoma/app/app.dart';

part 'app_stores.g.dart';

class AppStores = _AppStores with _$AppStores;

abstract class _AppStores with Store {
  _AppStores({
    required this.sharedPreferencesRepo,
  });
  final SharedPreferencesRepo sharedPreferencesRepo;
  @observable
  bool isOnBoarded = false;

  @observable
  bool isAuthenticated = false;

  @action
  void _getIsOnBoarded() {
    final _response = sharedPreferencesRepo.getOnBoardedStatus();
    isOnBoarded = _response;
  }

  @action
  void _getAuthenticationStatus() {
    final _response = sharedPreferencesRepo.getIsAuthenticated();
    isAuthenticated = _response;
  }

  @action
  void initializeApp(){
    _getIsOnBoarded();
    _getAuthenticationStatus();
  }
}
