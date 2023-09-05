import 'package:flutter/cupertino.dart';
import 'package:xiaoma/account/account.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/bookings/bookings.dart';
import 'package:xiaoma/chat/chat.dart';
import 'package:xiaoma/dashboard/dashboard.dart';
import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/onboarding/onboarding.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/settings/settings.dart';

Route? handleRoutes(RouteSettings settings) {
  switch (settings.name) {
    // onboard screen
    case OnBoardScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const OnBoardScreen();
        },
      );

    // Auth screens
    case LoginScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      );

    case ForgotPasswordScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const ForgotPasswordScreen();
        },
      );

    case RegistrationScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const RegistrationScreen();
        },
      );

    case OtpScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return OtpScreen(
            arguments: settings.arguments as Map<String, dynamic>,
          );
        },
      );

    case SetPassWordScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const SetPassWordScreen();
        },
      );

    // Dashsboard
    case DashboardScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const DashboardScreen();
        },
      );

    // Homescreen
    case HomeScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      );

    case ConfirmRideScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const ConfirmRideScreen();
        },
      );

    // Profile
    case PromoCodeScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const PromoCodeScreen();
        },
      );

    case ProfileScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const ProfileScreen();
        },
      );

      case AboutScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const AboutScreen();
        },
      );

      case SettingsScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const SettingsScreen();
        },
      );

      case BookingDetailScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const BookingDetailScreen();
        },
      );

    case ChatScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const ChatScreen();
        },
      );

    case CancelRideScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const CancelRideScreen();
        },
      );

      case AccountScreen.routeName:
      return CupertinoPageRoute(
        builder: (context) {
          return const AccountScreen();
        },
      );
    default:
      break;
  }
}
