import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoma/chat/chat.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/map/models/models.dart';
import 'package:xiaoma/map/screens/map_screen.dart';
import 'package:xiaoma/map/stores/map_screen_store.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores
  final MapScreenStore _mapScreenStore = locator<MapScreenStore>();

  //state
  bool ordered = false;
  bool isConfirmOrder = false;
  bool isDriverWaiting = false;

  @override
  void initState() {
    _mapScreenStore.processUserBitmapIcon();
    Future.delayed(Duration.zero, () async {
      await _mapScreenStore.processDriverBitmapIcons(
          image: "assets/car-left.png");
    });
    super.initState();
    // latestUserPostion();
  }

  @override
  void dispose() {
    // _positionStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: _size.height,
            ),
            child: const XiaoMaps(),
          ),
          Positioned(
            top: _size.height * .07,
            left: _size.width * .6,
            child: Row(
              children: [
                PhysicalModel(
                  color: AppColors.grey2,
                  elevation: 10,
                  shape: BoxShape.circle,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        _mapScreenStore.resetFields();
                        await mapSearchBottomSheet(
                          context: context,
                          size: _size,
                          onDestinationPlaceTap: (place) {
                            final _mapScreenStore = locator<MapScreenStore>();
                            _mapScreenStore.handleSelectedDestinationPlace(
                                value: place);
                            _mapScreenStore.predictedPlaces.clear();
                            XiamaLogger.debugPrint(
                                "selected destination ${_mapScreenStore.selectedDestinationPlace}");
                            if (_mapScreenStore.selectedDestinationPlace !=
                                    null &&
                                _mapScreenStore.selectedSourcePlace != null) {
                              Navigator.of(context).pop();
                              setState(() {
                                ordered = true;
                              });
                            }
                          },
                          onSavedPlaceTap: (place) {},
                          onSourcePlaceTap: (place) {
                            final _mapScreenStore = locator<MapScreenStore>();
                            _mapScreenStore.handleSelectedSourcePlace(
                                value: place);
                            _mapScreenStore.predictedPlaces.clear();
                            XiamaLogger.debugPrint(
                                "selected source ${_mapScreenStore.selectedSourcePlace}");
                            if (_mapScreenStore.selectedDestinationPlace !=
                                    null &&
                                _mapScreenStore.selectedSourcePlace != null) {
                              Navigator.of(context).pop();
                              setState(() {
                                ordered = true;
                              });
                            }
                          },
                        );
                        print("map search bottom sheet");
                        if (ordered) {
                          await Future.delayed(
                              const Duration(milliseconds: 700));
                          if (!mounted) return;
                          final _confirmOrderResult =
                              await confirmOrderBottomSheet(
                            context: context,
                            size: _size,
                            currentLocation: _mapScreenStore.selectedSourcePlace
                                as PlaceModel,
                            destinationLocation: _mapScreenStore
                                .selectedDestinationPlace as PlaceModel,
                            onConfirmRide: () async {},
                          );
                          setState(() {
                            ordered = false;
                          });
                          print("confirm order bottom sheet");

                          if (_confirmOrderResult == true) {
                            print("isConfirmOrder true");
                            await Future.delayed(
                                const Duration(milliseconds: 700));
                            if (!mounted) return;
                            final _confirmRideResult =
                                await showModalBottomSheet(
                              context: context,
                              isDismissible: true,
                              isScrollControlled: true,
                              constraints: BoxConstraints(
                                maxHeight: _size.height,
                                minHeight: _size.height,
                              ),
                              builder: (context) {
                                return const ConfirmRideScreen();
                              },
                            );
                            print("confirm order bottom sheet close");

                            if (_confirmRideResult == true) {
                              print("_confirmRideResult true");
                              if (!mounted) return;
                              await driverSelectionSheet(
                                size: _size,
                                context: context,
                                actionTapDriver: () async {},
                                moveDriverArrivingSheetUp: () async {
                                  setState(() {
                                    isConfirmOrder = false;
                                    isDriverWaiting = true;
                                  });
                                },
                              );

                              print("driverArrivingSheet show");
                              await Future.delayed(
                                  const Duration(milliseconds: 700));
                              if (!mounted) return;
                              await driverArrivingSheet(
                                context: context,
                                size: _size,
                                moveChatScreenPage: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                  setState(() {
                                    isDriverWaiting = false;
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  if (!mounted) return;
                                  Navigator.of(context)
                                      .pushNamed(ChatScreen.routeName);
                                },
                                cancelRide: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                  setState(() {
                                    isDriverWaiting = false;
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  if (!mounted) return;
                                  Navigator.of(context)
                                      .pushNamed(CancelRideScreen.routeName);
                                },
                                movePhoneCallPage: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                  setState(() {
                                    isDriverWaiting = false;
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 700));
                                },
                              );
                            }
                          }
                        }
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(CupertinoIcons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppConstants.SIZEBOX_PADDING_L,
                ),
                PhysicalModel(
                  color: AppColors.grey2,
                  elevation: 10,
                  shape: BoxShape.circle,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {},
                      child: Ink(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.notifications_none_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
