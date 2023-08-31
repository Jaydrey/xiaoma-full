// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = "/settings-screen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // functions
  void _actionSettingsBack() {
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _actionAddHome() {}
  void _actionSavedLocationScreen() {}
  void _actionChooseLanguage() {}
  void _actionManageContacts() {}
  void _actionVerifyTrips() {}
  void _actionAddWork() {}
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _actionSettingsBack,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            minHeight: _size.height,
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Locations",
                style: _theme.textTheme.displayMedium,
              ),
              Container(
                height: 10,
                margin: const EdgeInsets.only(top: 10),
              ),
              // add home
              GestureDetector(
                onTap: _actionAddHome,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_home_work,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Add home location",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColors.grey2,
              ),
              Container(
                height: 10,
              ),
              GestureDetector(
                onTap: _actionAddWork,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.work_outlined,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Add work location",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColors.grey2,
              ),
              Container(
                height: 10,
              ),
              GestureDetector(
                onTap: _actionSavedLocationScreen,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.location_history,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Saved places",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColors.grey2,
              ),
              Container(
                height: 20,
              ),
              // Text(
              //   "",
              //   style: _theme.textTheme.displayMedium,
              // ),
              GestureDetector(
                onTap: _actionChooseLanguage,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.language,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Chosen language",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text("English"),
                ),
              ),
              Container(height: 20),
              Text(
                "Security",
                style: _theme.textTheme.displayMedium,
              ),
              Container(height: 10),
              GestureDetector(
                onTap: _actionVerifyTrips,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.barcode_reader,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Barcode your trips",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                      "Use a barcode to ensure you are in the right and safest ride."),
                ),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColors.grey2,
              ),
              Container(
                height: 10,
              ),
              GestureDetector(
                onTap: _actionManageContacts,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.grey1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.location_history,
                      color: AppColors.green1,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    "Manage your ride contacts",
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                      "Add close family and friends into the loop of your rides."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
