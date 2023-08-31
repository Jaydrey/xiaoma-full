import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xiaoma/app/app.dart';
// import 'package:xiaoma/chat/chat.dart';
// import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/map/models/models.dart';
import 'package:xiaoma/map/stores/stores.dart';
// import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/utils/locator.dart';
import 'package:xiaoma/widgets/widgets.dart';

Future<void> mapSearchBottomSheet({
  required BuildContext context,
  required Size size,
  required ValueChanged<PlaceModel> onSavedPlaceTap,
  required ValueChanged<PlaceModel> onSourcePlaceTap,
  required ValueChanged<PlaceModel> onDestinationPlaceTap,
}) async {
  final MapScreenStore _mapScreenStore = locator<MapScreenStore>();
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  await showModalBottomSheet(
    constraints: BoxConstraints(
      minHeight: size.height * .65,
      maxHeight: size.height * .75,
      minWidth: size.width,
    ),
    elevation: 8,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    builder: (context) {
      return Observer(
        builder: (_) {
          return Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 4,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_ML),
                //TODO change back
                const Text(
                  "Select Address",
                  style: TextStyle(
                    color: AppColors.black2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 13),
                const Divider(
                  color: AppColors.grey1,
                  thickness: 1,
                ),
                const SizedBox(height: 13),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "From",
                          fill: true,
                          controller: sourceController,
                          fillColor: AppColors.grey2.withAlpha(100),
                          hasBorder: false,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.map_pin_ellipse),
                          ),
                          onTap: () {
                            _mapScreenStore.handleSearchFieldStatus(
                              value: MapSearchFieldStatus.source,
                            );
                          },
                          onChanged: (newValue) async {
                            _mapScreenStore.handleSourceQuery(value: newValue);
                            await _mapScreenStore.handlePlaceAutoCompletion(
                                query: newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //TODO Implement the separator
                const SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_XL),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        alignment: Alignment.bottomLeft,
                        icon: const Icon(
                          CupertinoIcons.location_solid,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Destination",
                          fill: true,
                          controller: destinationController,
                          fillColor: AppColors.grey2.withAlpha(100),
                          hasBorder: false,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.location_solid,
                              color: AppColors.grey3.withAlpha(200),
                            ),
                          ),
                          onTap: () {
                            _mapScreenStore.handleSearchFieldStatus(
                                value: MapSearchFieldStatus.destination);
                          },
                          onChanged: (newValue) async {
                            _mapScreenStore.handleDestinationQuery(
                                value: newValue);
                            await _mapScreenStore.handlePlaceAutoCompletion(
                                query: newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                if (_mapScreenStore.searchFieldStatus ==
                    MapSearchFieldStatus.saved)
                  const Divider(
                    color: AppColors.grey1,
                    thickness: 1,
                  ),
                if (_mapScreenStore.searchFieldStatus ==
                    MapSearchFieldStatus.saved)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: const EdgeInsets.only(bottom: 10),
                            alignment: Alignment.bottomLeft,
                            iconSize: 30,
                            icon: const Icon(
                              CupertinoIcons.bookmark_fill,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 13),
                          const Text(
                            "Saved Places",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                const Divider(
                  color: AppColors.grey1,
                  thickness: 1,
                ),
                const SizedBox(height: 13),
                if (_mapScreenStore.searchFieldStatus ==
                    MapSearchFieldStatus.source)
                  Expanded(
                    child: sourcePlacesList(
                      context: context,
                      places: _mapScreenStore.predictedPlaces,
                      controller: sourceController,
                      onSourcePlaceTap: onSourcePlaceTap,
                    ),
                  ),
                if (_mapScreenStore.searchFieldStatus ==
                    MapSearchFieldStatus.destination)
                  Expanded(
                    child: destinationPlacesList(
                      context: context,
                      places: _mapScreenStore.predictedPlaces,
                      controller: destinationController,
                      onDestinationPlaceTap: onDestinationPlaceTap,
                    ),
                  ),
                if (_mapScreenStore.searchFieldStatus ==
                    MapSearchFieldStatus.saved)
                  Expanded(
                    child: savedPlacesList(
                        context: context,
                        places: _mapScreenStore.savedPlaces,
                        onSavedPlaceTap: onSavedPlaceTap),
                  ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget destinationPlacesList({
  required BuildContext context,
  required List<PlaceModel> places,
  required TextEditingController controller,
  required ValueChanged<PlaceModel> onDestinationPlaceTap,
}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: places.length,
    itemBuilder: (context, placeIndex) {
      final place = places[placeIndex];
      return ListTile(
        leading: const Icon(CupertinoIcons.clock),
        contentPadding:
            const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
        title: Text(
          place.description ?? "",
        ),
        subtitle: Text(
          place.address ?? "",
        ),
        trailing: Text(
          "${place.distance ?? ""} ${place.unit?.name ?? ""}",
        ),
        onTap: () {
          controller.text = place.description ?? "";
          onDestinationPlaceTap(place);
        },
      );
    },
  );
}

Widget sourcePlacesList({
  required BuildContext context,
  required List<PlaceModel> places,
  required TextEditingController controller,
  required ValueChanged<PlaceModel> onSourcePlaceTap,
}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: places.length,
    itemBuilder: (context, placeIndex) {
      final place = places[placeIndex];
      return ListTile(
        leading: const Icon(CupertinoIcons.clock),
        contentPadding:
            const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
        title: Text(
          place.description ?? "",
        ),
        subtitle: Text(
          place.address ?? "",
        ),
        trailing: Text(
          "${place.distance ?? ""} ${place.unit?.name ?? ""}",
        ),
        onTap: () {
          controller.text = place.description ?? "";
          onSourcePlaceTap(place);
        },
      );
    },
  );
}

Widget savedPlacesList({
  required BuildContext context,
  required List<PlaceModel> places,
  required ValueChanged<PlaceModel> onSavedPlaceTap,
}) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: places.length,
    itemBuilder: (context, placeIndex) {
      final place = places[placeIndex];
      return ListTile(
        leading: const Icon(CupertinoIcons.clock),
        contentPadding:
            const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
        title: Text(
          place.description ?? "",
        ),
        subtitle: Text(
          place.address ?? "",
        ),
        trailing: Text(
          "${place.distance ?? ""} ${place.unit?.name ?? ""}",
        ),
        onTap: () {},
      );
    },
  );
}

Future<bool> confirmOrderBottomSheet({
  required BuildContext context,
  required Size size,
  required PlaceModel currentLocation,
  required PlaceModel destinationLocation,
  required VoidCallback onConfirmRide,
}) async {
  final _result = await showModalBottomSheet(
    constraints: BoxConstraints(
      minHeight: size.height * .6,
      maxHeight: size.height * .6,
      minWidth: size.width,
    ),
    elevation: 8,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_ML),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Distance",
                  style: TextStyle(
                    color: AppColors.black2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "11.8 km",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            const Divider(
              color: AppColors.grey1,
              thickness: 1,
            ),
            const SizedBox(height: 13),
            ListTile(
              leading: myLocationIconOrder(),
              contentPadding:
                  const EdgeInsets.only(right: 10, left: 5, top: 10, bottom: 0),
              title: const Text(
                "My Current Location",
              ),
              subtitle: Text(
                currentLocation.description ?? "",
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () {},
            ),
            // const SizedBox(height: XiamaConst.XIAMA_SIZEBOX_PADDING_XL),
            ListTile(
              leading: const Icon(CupertinoIcons.clock),
              contentPadding:
                  const EdgeInsets.only(right: 10, left: 5, top: 10, bottom: 0),
              title: Text(
                destinationLocation.description ?? "",
              ),
              subtitle: const Text(
                "",
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () {},
            ),

            SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_XL),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 700));
                print("confirm order bottom sheet close");
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Confirm Order",
                style: TextStyle(
                  color: AppColors.black1,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
  return _result;
}

Future<void> driverSelectionSheet({
  required BuildContext context,
  required Size size,
  required VoidCallback moveDriverArrivingSheetUp,
  required VoidCallback actionTapDriver,
}) async {
  Timer(
    const Duration(seconds: 3),
    () async {
      Navigator.of(context).pop();
      await Future.delayed(const Duration(milliseconds: 750));
      moveDriverArrivingSheetUp();
    },
  );

  await showModalBottomSheet(
    elevation: 8,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        height: size.height * .45,
        padding: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "It will only take a moment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black1,
              ),
            ),
            Observer(
              builder: (_) {
                return myLocationIconOrder(
                  minRadius: 50,
                  ripplesCount: 6,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      color: AppColors.primaryColor.withAlpha(100),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 25,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withAlpha(180),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 40,
                                child: Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const CustomElevatedButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: AppColors.black1,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> driverArrivingSheet({
  required BuildContext context,
  required Size size,
  required VoidCallback moveChatScreenPage,
  required VoidCallback movePhoneCallPage,
  required VoidCallback cancelRide,
}) async {
  showModalBottomSheet(
    context: context,
    elevation: 8,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        height: size.height * .50,
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: size.width * .3,
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.grey2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Driver is arriving",
                  style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "3 minutes",
                  style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.grey1, thickness: 2),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/driver-pic.png",
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Mark Jones",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Silver-Grey-Honda Fit",
                      style: TextStyle(
                        color: AppColors.grey3,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                        ),
                        Text("4.5"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "KDD 44CF",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: moveChatScreenPage,
                  child: Ink(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.message),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: movePhoneCallPage,
                  child: Ink(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.phone_android_outlined),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: cancelRide,
                  child: Ink(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withAlpha(100),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      );
    },
  );
}

Future<void> orderRideDialog({
  required BuildContext context,
  required Size size,
  required VoidCallback actionAnotherRide,
  required VoidCallback actionNotNow,
}) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        content: Container(
          height: size.height * .6,
          width: size.width * .8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          constraints: BoxConstraints(
            maxHeight: size.height * .6,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/maps/perm_map.svg",
              ),
              const SizedBox(height: 15),
              const Text(
                "You can order",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "another ride",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppConstants.XIAMA_SIZEBOX_PADDING_XL),
              CustomElevatedButton(
                onPressed: actionAnotherRide,
                child: const Text(
                  "Another Ride",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomElevatedButton(
                onPressed: actionNotNow,
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.primaryColor.withAlpha(
                      180,
                    ),
                  ),
                ),
                child: const Text(
                  "Not Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
