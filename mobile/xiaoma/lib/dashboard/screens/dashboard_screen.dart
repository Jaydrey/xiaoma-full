import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:xiaoma/account/account.dart';
import 'package:xiaoma/bookings/screens/bookings_screen.dart';
import 'package:xiaoma/chat/screens/chat_screen.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/home/screens/home_screen.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/wallet/screens/wallet_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const routeName = "/dashboard-screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //controllers
  final _panelController = PanelController();

  // states
  int _currentIndex = 0;
  // screens
  final _screens = [
    const HomeScreen(),
    const BookingScreen(),
    const ChatScreen(),
    const WalletScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _panelController.close();
    super.dispose();
    Future.delayed(const Duration(seconds: 10), () async {});
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        backgroundColor: AppColors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: AppColors.green1,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.grey2,
          fontSize: 14,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: AppConstants.BOTTOM_NAVIGATION_1,
            icon: SvgPicture.asset(
              AppConstants.NAVS_1,
              height: 30,
              width: 15,
              color: AppColors.grey2,
            ),
            activeIcon: SvgPicture.asset(
              AppConstants.NAVS_1,
              height: 30,
              width: 15,
              color: AppColors.green1,
            ),
          ),
          BottomNavigationBarItem(
            label: AppConstants.BOTTOM_NAVIGATION_2,
            icon: SvgPicture.asset(
              AppConstants.NAVS_2,
              height: 35,
              width: 20,
            ),
            activeIcon: SvgPicture.asset(
              AppConstants.NAVS_2,
              height: 30,
              width: 15,
              color: AppColors.green1,
            ),
          ),
          BottomNavigationBarItem(
            label: AppConstants.BOTTOM_NAVIGATION_3,
            icon: SvgPicture.asset(
              AppConstants.NAVS_3,
              height: 35,
              width: 20,
            ),
            activeIcon: SvgPicture.asset(
              AppConstants.NAVS_3,
              height: 30,
              width: 15,
              color: AppColors.green1,
            ),
          ),
          BottomNavigationBarItem(
            label: AppConstants.BOTTOM_NAVIGATION_4,
            icon: SvgPicture.asset(
              AppConstants.NAVS_4,
              height: 35,
              width: 20,
            ),
            activeIcon: SvgPicture.asset(
              AppConstants.NAVS_4,
              height: 30,
              width: 15,
              color: AppColors.green1,
            ),
          ),
          BottomNavigationBarItem(
            label: AppConstants.BOTTOM_NAVIGATION_5,
            icon: SvgPicture.asset(
              AppConstants.NAVS_5,
              height: 35,
              width: 20,
            ),
            activeIcon: SvgPicture.asset(
              AppConstants.NAVS_5,
              height: 30,
              width: 15,
              color: AppColors.green1,
            ),
          ),
        ],
      ),
    );
  }
}
