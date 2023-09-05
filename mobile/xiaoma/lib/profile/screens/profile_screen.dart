// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = "/profile-screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // functions
  void _actionProfileBack() {
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _actionEditFullName() {}
  void _actionEditEmail() {}
  void _actionEditPhoneNumber() {}

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _actionProfileBack,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Profile"),
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
              // profile image
              Container(
                alignment: Alignment.center,
                height: _size.width * .3,
                decoration: BoxDecoration(
                  border: Border.all(width: 0, style: BorderStyle.none),
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: .5,
                    colors: [
                      AppColors.white,
                      AppColors.grey1.withAlpha(100),
                      AppColors.grey2.withAlpha(150),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: _size.width * .3,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 5, color: AppColors.primaryColor),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Positioned(
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: AppColors.grey3,
                          size: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      right: _size.width * .34,
                      bottom: 0,
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.grey3,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
                margin: const EdgeInsets.only(top: 20),
              ),
              Text(
                "User Details",
                style: _theme.textTheme.displayMedium,
              ),
              Container(
                height: 10,
                margin: const EdgeInsets.only(top: 10),
              ),
              GestureDetector(
                onTap: _actionEditFullName,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Full Name",
                    style: _theme.textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "Michael Cheruiyot",
                    style: _theme.textTheme.bodyMedium,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey3,
                  ),
                ),
              ),
              Container(
                  height: 1,
                  margin: const EdgeInsets.only(top: 10),
                  color: AppColors.grey2),
              GestureDetector(
                onTap: _actionEditEmail,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Email",
                    style: _theme.textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "michael87@gmail.com",
                    style: _theme.textTheme.bodyMedium,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey3,
                  ),
                ),
              ),
              Container(
                  height: 1,
                  margin: const EdgeInsets.only(top: 10),
                  color: AppColors.grey2),
              GestureDetector(
                onTap: _actionEditPhoneNumber,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Phone number",
                    style: _theme.textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "0717126871",
                    style: _theme.textTheme.bodyMedium,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey3,
                  ),
                ),
              ),

              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColors.grey2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
