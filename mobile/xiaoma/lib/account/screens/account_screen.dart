// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:xiaoma/account/account.dart';
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/settings/settings.dart';
import 'package:xiaoma/utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const routeName = "/account-screen";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // stores
  final _sharedPreferencesRepo = locator<SharedPreferencesRepo>();
  // functions
  void _actionTapProfile() {
    if (!mounted) return;
    Navigator.of(context).pushNamed(ProfileScreen.routeName);
  }

  void _actionTapPromoCode() {
    if (!mounted) return;
    Navigator.of(context).pushNamed(PromoCodeScreen.routeName);
  }

  void _actionTapSettings() {
    if (!mounted) return;
    Navigator.of(context).pushNamed(SettingsScreen.routeName);
  }

  void _actionAboutScreen() {
    if (!mounted) return;
    Navigator.of(context).pushNamed(AboutScreen.routeName);
  }

  void _actionHelpScreen() {}
  void _actionBecomeDriver() {}
  void _actionLogOut() async {
    await _sharedPreferencesRepo.setIsAuthenticated(value: false);
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      // backgroundColor: AppColors.grey2.withAlpha(100),
      body: Container(
        width: _size.width,
        constraints: BoxConstraints(
          minHeight: _size.height,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // profile
              GestureDetector(
                onTap: _actionTapProfile,
                child: Ink(
                  color: AppColors.backgroundColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // profile photo
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, style: BorderStyle.none),
                          color: AppColors.grey2.withAlpha(100),
                          gradient: RadialGradient(
                            center: Alignment.center,
                            radius: .5,
                            colors: [
                              AppColors.white,
                              AppColors.grey1.withAlpha(100),
                              AppColors.grey2.withAlpha(150),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.grey3,
                          size: 32,
                        ),
                      ),

                      const SizedBox(height: 10),
                      // name and email
                      Text(
                        "Michael",
                        style: _theme.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "michael87@gmail.com",
                        style: _theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // User Rating
                      Container(
                        width: _size.width * .25,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.grey2.withAlpha(100),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "5.0",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
                color: AppColors.grey2.withAlpha(100),
              ),
              InkWell(
                child: Ink(
                  color: AppColors.backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // settings
                      ListTile(
                        onTap: _actionTapSettings,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.settings,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "Settings",
                          style: _theme.textTheme.bodyMedium,
                        ),
                      ),
                      // promotion code
                      ListTile(
                        onTap: _actionTapPromoCode,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.price_change,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "Promotion Codes",
                          style: _theme.textTheme.bodyMedium,
                        ),
                      ),
                      // earn money driving
                      ListTile(
                        onTap: _actionBecomeDriver,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.drive_eta,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "Become a Driver",
                          style: _theme.textTheme.bodyMedium,
                        ),
                        subtitle: const Text("Earn by driving"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
                color: AppColors.grey2.withAlpha(100),
              ),
              InkWell(
                child: Ink(
                  color: AppColors.backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // help
                      ListTile(
                        onTap: _actionHelpScreen,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.help,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "Help",
                          style: _theme.textTheme.bodyMedium,
                        ),
                      ),
                      // about
                      ListTile(
                        onTap: _actionAboutScreen,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.info,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "About",
                          style: _theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
                color: AppColors.grey2.withAlpha(100),
              ),
              InkWell(
                child: Ink(
                  color: AppColors.backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // logout
                      ListTile(
                        onTap: _actionLogOut,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.logout,
                            size: 28,
                            color: AppColors.green1,
                          ),
                        ),
                        title: Text(
                          "Log out",
                          style: _theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
