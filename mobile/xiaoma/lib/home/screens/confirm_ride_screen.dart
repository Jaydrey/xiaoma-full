import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiaoma/chat/chat.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class ConfirmRideScreen extends StatefulWidget {
  const ConfirmRideScreen({Key? key}) : super(key: key);
  static const routeName = "/confirm-ride-screen";

  @override
  State<ConfirmRideScreen> createState() => _ConfirmRideScreenState();
}

class _ConfirmRideScreenState extends State<ConfirmRideScreen> {
// stores
  final _promocodeStore = locator<PromoCodeStore>();
  final _confirmRideStore = locator<ConfirmRideStore>();

  // contollers
  final _promoCodeController = TextEditingController();
// functions
  void _handleAddPromoCode() async {
    _promocodeStore.changeScreenTitle(
      value: PromoCodeScreenTitles.addPromoCode,
    );
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    final _promo = await Navigator.of(context)
        .pushNamed(PromoCodeScreen.routeName) as String;
    if (_promo != null) {
      _promoCodeController.text = _promo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(
        left: AppConstants.XIAMA_SCREEN_PADDING,
        right: AppConstants.XIAMA_SCREEN_PADDING,
      ),
      color: AppColors.backgroundColor,
      // alignment: Alignment.center,
      height: _size.height,
      constraints: BoxConstraints(
        minHeight: _size.height,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _size.height * .1,
            ),
            const Text(
              "Confirm Ride",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.black1,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: AppConstants.XIAMA_SIZEBOX_PADDING_XXL,
            ),
            const Center(
              child: Text(
                "Confirm the vehicle to order the ride",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey3,
                ),
              ),
            ),
            Image.asset(
              "assets/maps/confirm_ride.png",
              height: 400,
              filterQuality: FilterQuality.high,
            ),
            const Divider(
              color: AppColors.grey1,
              thickness: 1,
            ),
            const SizedBox(
              height: AppConstants.XIAMA_SIZEBOX_PADDING_LL,
            ),
            const Text(
              "Promo Code",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.black2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: AppConstants.XIAMA_SIZEBOX_PADDING_LL,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomTextFormField(
                    controller: _promoCodeController,
                    hintText: "Enter Promo Code",
                    hasBorder: false,
                    fillColor: AppColors.grey2.withAlpha(100),
                    fill: true,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor.withAlpha(70),
                    child: IconButton(
                      onPressed: _handleAddPromoCode,
                      color: AppColors.black2,
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppConstants.XIAMA_SIZEBOX_PADDING_LL,
            ),
            Card(
              color: AppColors.backgroundColor,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_rounded,
                          color: AppColors.grey2,
                        ),
                        SizedBox(
                          width: AppConstants.SIZEBOX_PADDING_XS,
                        ),
                        Text(
                          "11.8km",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.access_time_outlined,
                          color: AppColors.grey2,
                        ),
                        SizedBox(
                          width: AppConstants.SIZEBOX_PADDING_XS,
                        ),
                        Text(
                          "32 mins",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: AppColors.grey2,
                        ),
                        SizedBox(
                          width: AppConstants.SIZEBOX_PADDING_XS,
                        ),
                        Text(
                          "750 Yen",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppConstants.SIZEBOX_PADDING_MD,
            ),
            Observer(
              builder: (_) {
                return CustomElevatedButton(
                  onPressed: () async {
                    _confirmRideStore.changeStartTime(value: DateTime.now());
                    await Future.delayed(const Duration(milliseconds: 700));
                    if (!mounted) return;
                    Navigator.of(context).pop(true);
                    await Future.delayed(const Duration(milliseconds: 700));
                    // if (!mounted) return;
                    // await driverSelectionSheet(
                    //   size: _size,
                    //   context: context,
                    //   actionTapDriver: () async {},
                    //   moveDriverArrivingSheetUp: () async {
                    //     setState(() {
                    //       isConfirmOrder = false;
                    //       isDriverWaiting = true;
                    //     });
                    //   },
                    // );
                  },
                  elevation: 3,
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black2,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
