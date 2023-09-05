import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiaoma/auth/auth.dart';

import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/mixins/mixins.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = "/forgot-password";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with ValidationMixins {
  // keys
  final _formKey = GlobalKey<FormState>();
  // states
  bool _isLoading = false;

  // arguments
  final _passInfo = {
    "tag": "forgot_password",
  };

  // functions
  Future<void> _testFunction({required BuildContext? funcContext}) async {
    if (FocusScope.of(funcContext!).hasFocus) {
      FocusScope.of(funcContext).unfocus();
    }
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 3),
    );
    setState(() {
      _isLoading = false;
    });

    if (!mounted) return;
    Navigator.of(funcContext).pushNamed(
      OtpScreen.routeName,
      arguments: {
        "tag": "forgot_password",
      },
    );
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
            children: [
              SizedBox(
                height: _size.height * .1,
              ),
              const Center(
                child: Text(
                  "Forgot Password?",
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
                  AppConstants.AUTH_FORGOT_PASSWORD1,
                ),
              ),
              const SizedBox(
                height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
              ),
              const Center(
                child: Text(
                  "Please enter the phone number or email\n you used to sign in.",
                  style: TextStyle(
                    color: AppColors.grey3,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(
                      builder: (_) {
                        return const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.SIZEBOX_PADDING_MD,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFormField(
                          // prefixIcon: _forgotPasswordStore.isEmail
                          //     ? const Icon(
                          //         CupertinoIcons.mail,
                          //         color: XiamaColors.grey3,
                          //       )
                          //     : const Icon(
                          //         CupertinoIcons.phone,
                          //         color: XiamaColors.grey3,
                          //       ),
                          prefixText: "+254",
                          prefixIcon: const Icon(
                            CupertinoIcons.phone,
                            color: AppColors.grey3,
                          ),
                          hintText: "0712345678",
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                          },
                          validator: validatePhoneNumber,
                          keyboardType: TextInputType.phone,
                          // validator: _forgotPasswordStore.isEmail? validateEmail:validatePhoneNumber,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: _size.height * .1),
              CustomElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        _testFunction(funcContext: context);
                      },
                child: _isLoading
                    ? MiniWidgets.circularProgressIndicatorOnButton()
                    : const Text(
                        "Request password reset",
                        style: TextStyle(
                          color: AppColors.black1,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
