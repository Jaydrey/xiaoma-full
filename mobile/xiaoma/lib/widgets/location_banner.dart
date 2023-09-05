import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/map/stores/map_screen_store.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class LocationBanner extends StatefulWidget {
  final VoidCallback? onPressedAllow;
  final VoidCallback? onPressedDeny;
  const LocationBanner({
    Key? key,
    this.onPressedAllow,
    this.onPressedDeny,
  }) : super(key: key);

  @override
  State<LocationBanner> createState() => _LocationBannerState();
}

class _LocationBannerState extends State<LocationBanner> {
  //stores
  final MapScreenStore _mapScreenStore = locator<MapScreenStore>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          left: MediaQuery.of(context).size.height * .03,
          right: MediaQuery.of(context).size.width * .05,
          child: Container(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .9,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0, style: BorderStyle.none),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                SvgPicture.asset(
                  "assets/maps/perm_map.svg",
                ),
                const SizedBox(height: AppConstants.SIZEBOX_PADDING_L),
                const Text(
                  "Enable Location",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: AppConstants.SIZEBOX_PADDING_L),
                const Text(
                  "We need access to your location to\n be able to use this service",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey3,
                    decoration: TextDecoration.none,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_XML),
                CustomElevatedButton(
                  onPressed: widget.onPressedAllow,
                  child: const Text(
                    "Enable Location",
                    style: TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.SIZEBOX_PADDING_L),
                CustomElevatedButton(
                  onPressed: widget.onPressedDeny,
                  child: const Text(
                    "Not Now",
                    style: TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
