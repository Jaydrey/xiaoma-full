import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/auth/stores/stores.dart';
import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/map/repository/map_repo.dart';
import 'package:xiaoma/map/stores/map_screen_store.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/utils/utils.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  // auth
  locator.registerSingleton<LoginScreenStore>(LoginScreenStore());
  locator.registerSingleton<SetPasswordStore>(SetPasswordStore());
  locator.registerSingleton<RegistrationScreenStore>(RegistrationScreenStore());

  // shared preferences
  locator.registerSingleton(
    SharedPreferencesRepo(prefs: await preferences),
  );

  // app
  locator.registerSingleton(
    AppStores(
      sharedPreferencesRepo: locator<SharedPreferencesRepo>(),
    ),
  );

  //functions
  locator.registerSingleton<GoogleMapsFunctions>(GoogleMapsFunctions());

  //  maps
  locator.registerSingleton<MapsRepo>(MapsRepo());
  locator.registerSingleton<MapScreenStore>(MapScreenStore(
    mapsFunctions: locator<GoogleMapsFunctions>(),
    mapsRepo: locator<MapsRepo>(),
  ));

  // promocode store
  locator.registerSingleton<PromoCodeStore>(PromoCodeStore());

  // ride
  locator.registerSingleton<CancelRideStore>(CancelRideStore());
  locator.registerSingleton<ConfirmRideStore>(ConfirmRideStore());

}
