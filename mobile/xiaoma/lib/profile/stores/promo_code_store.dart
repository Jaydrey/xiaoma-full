import 'package:mobx/mobx.dart';

part 'promo_code_store.g.dart';

class PromoCodeStore = _PromoCodeStore with _$PromoCodeStore;

abstract class _PromoCodeStore with Store {
  @observable
  PromoCodeScreenTitles screenTitle = PromoCodeScreenTitles.promoCode;

  @observable
  int? currentCodeIndex;

  @action
  void changeScreenTitle({required PromoCodeScreenTitles value}) {
    screenTitle = value;
  }

  @action
  void changeCurrentCodeIndex({required int value}) {
    currentCodeIndex = value;
  }
}

enum PromoCodeScreenTitles {
  promoCode,
  addPromoCode,
}

extension PromoCode on PromoCodeScreenTitles {
  String getScreenTitle() {
    switch (this) {
      case PromoCodeScreenTitles.promoCode:
        return "Promo Code";
      case PromoCodeScreenTitles.addPromoCode:
        return "Add Promo";
      default:
        return "";
    }
  }
}
