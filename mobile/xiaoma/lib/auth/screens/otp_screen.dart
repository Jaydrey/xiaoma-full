import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/dashboard/screens/dashboard_screen.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/loggings.dart';
import 'package:xiaoma/widgets/widgets.dart';

class OtpScreen extends StatefulWidget {
  final Map<String, dynamic>? arguments;
  const OtpScreen({
    super.key,
    this.arguments,
  });
  static const routeName = "/otp-screen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // states
  bool _isLoading = false;

  // controller
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode pinPutFocusNode = FocusNode();

  // pinput widget
  final defaultPinTheme = const PinTheme(
    width: 70,
    height: 70,
    textStyle: TextStyle(
      fontSize: 40,
      color: AppColors.black2,
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.grey2,
          width: 2,
        ),
      ),
    ),
  );

  // functions
  Future<void> _testFunction({
    required BuildContext? funcContext,
  }) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
    XiamaLogger.debugPrint("args ${widget.arguments}");

    if (!mounted) return;
    if (widget.arguments == null) return;
    if (widget.arguments?["tag"] == "forgot_password") {
      Navigator.of(context).pushNamed(SetPassWordScreen.routeName);
      return;
    }

    if (widget.arguments?["tag"] == "register_account") {
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.only(
          left: AppConstants.XIAMA_SCREEN_PADDING,
          right: AppConstants.XIAMA_SCREEN_PADDING,
        ),
        height: _size.height,
        constraints: BoxConstraints(
          minHeight: _size.height,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _size.height * .1),
              const Center(
                child: Text(
                  "Let's go!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
              ),
              Center(
                child: Image.asset(
                  AppConstants.AUTH_OTP_SMS,
                ),
              ),
              const SizedBox(
                height: AppConstants.SIZEBOX_PADDING_L,
              ),
              const Center(
                child: Text(
                  "We just texted you.",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: AppConstants.XIAMA_SIZEBOX_PADDING_XXL,
              ),
              const Center(
                child: Text(
                  "Please enter the code we sent via sms",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.grey3,
                  ),
                ),
              ),
              const SizedBox(
                height: AppConstants.SIZEBOX_PADDING_L,
              ),
              const Center(
                child: Text(
                  "Confirmation code",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
              ),
              Center(
                child: Pinput(
                  focusNode: pinPutFocusNode,
                  controller: pinPutController,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                  listenForMultipleSmsOnAndroid: true,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  defaultPinTheme: defaultPinTheme,
                ),
              ),
              SizedBox(height: _size.height * .2),
              CustomElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        await _testFunction(
                          funcContext: context,
                        );
                      },
                child: _isLoading
                    ? MiniWidgets.circularProgressIndicatorOnButton()
                    : const Text(
                        "Send",
                        style: TextStyle(
                          color: AppColors.black1,
                        ),
                      ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend code",
                    style: TextStyle(
                      color: AppColors.black2,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.black2,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinPut {}
