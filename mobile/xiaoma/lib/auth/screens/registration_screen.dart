import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/auth/screens/screens.dart';
import 'package:xiaoma/auth/stores/stores.dart';
import 'package:xiaoma/mixins/mixins.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const routeName = "/registration-screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ValidationMixins {
  // keys
  final _formKey = GlobalKey<FormState>();

  // stores
  final _loginScreenStore = locator<LoginScreenStore>();
  final _registrationScreenStore = locator<RegistrationScreenStore>();
  final _sharedPreferencesRepo = locator<SharedPreferencesRepo>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
                    ),
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.SIZEBOX_PADDING_MD,
                    ),
                    Observer(
                      builder: (context) {
                        return CustomTextFormField(
                          hasPrefixIcon: true,
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                          ),
                          hintText: "John Doe",
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                            _registrationScreenStore.fullName = newValue.trim();
                          },
                          validator: validateFullName,
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XL,
                    ),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.SIZEBOX_PADDING_MD,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFormField(
                          keyboardType: TextInputType.number,
                          prefixText: "+254",
                          prefixIcon: const Icon(
                            CupertinoIcons.phone,
                            color: AppColors.grey3,
                          ),
                          initialValue: _loginScreenStore.phoneNumber,
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                            _loginScreenStore.phoneNumber = newValue.trim();
                          },
                          validator: validatePhoneNumber,
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XL,
                    ),
                    const Text(
                      "Choose password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.SIZEBOX_PADDING_MD,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFormField(
                          hasPrefixIcon: true,
                          showPassword: _registrationScreenStore.obscureText,
                          prefixIcon: const Icon(
                            CupertinoIcons.padlock,
                            color: AppColors.grey3,
                          ),
                          hintText: "Minimum 8 characters",
                          suffixIcon:
                              _registrationScreenStore.obscureText == false
                                  ? IconButton(
                                      onPressed: () {
                                        _registrationScreenStore
                                            .handleShowPassword();
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.eye,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _registrationScreenStore
                                            .handleShowPassword();
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.eye_slash,
                                      ),
                                    ),
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }

                            _registrationScreenStore.password = newValue.trim();
                          },
                          validator: validatePassword,
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XL,
                    ),
                    const Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.SIZEBOX_PADDING_MD,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextFormField(
                          hasPrefixIcon: true,
                          showPassword:
                              _registrationScreenStore.ObscureConfirmText,
                          prefixIcon: const Icon(
                            CupertinoIcons.padlock,
                          ),
                          hintText: "Minimum 8 characters",
                          suffixIcon:
                              _registrationScreenStore.ObscureConfirmText ==
                                      false
                                  ? IconButton(
                                      onPressed: () {
                                        _registrationScreenStore
                                            .handleShowConfirmPassword();
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.eye,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _registrationScreenStore
                                            .handleShowConfirmPassword();
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.eye_slash,
                                      ),
                                    ),
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                            _registrationScreenStore.obscureConfirmPassword =
                                newValue;
                          },
                          validator: validatePassword,
                          // initialValue: _loginScreenStore.phoneNumber,
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SignUpDivider(),
                        Expanded(
                          child: Column(
                            children: const [
                              Center(
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                    color: AppColors.black1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  " continue with",
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
                        const SignUpDivider(),
                      ],
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            side: const BorderSide(
                              color: AppColors.grey2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppConstants.AUTH_REGISTRATION_GOOGLE,
                                height: 20,
                              ),
                              const SizedBox(
                                width: AppConstants.SIZEBOX_PADDING_L,
                              ),
                              const Text(
                                "Sign Up with Google",
                                style: TextStyle(
                                  color: AppColors.black2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.XIAMA_SIZEBOX_PADDING_XML,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomElevatedButton(
                          onPressed: () async {
                            if (FocusScope.of(context).hasFocus) {
                              FocusScope.of(context).unfocus();
                            }
                            if (_formKey.currentState?.validate() == false) {
                              return;
                            }
                            _formKey.currentState?.save();
                            if (_registrationScreenStore
                                    .obscureConfirmPassword !=
                                _registrationScreenStore.password) {
                              return;
                            }
                            _registrationScreenStore.handleIsregistering(
                                value: true);
                            XiamaLogger.debugPrint(
                                "isRegistering ${_registrationScreenStore.isRegistering}");
                            await Future.wait(
                              [
                                Future.delayed(
                                  const Duration(seconds: 3),
                                  () {
                                    _registrationScreenStore
                                        .handleIsregistering(value: false);
                                    XiamaLogger.debugPrint(
                                        "isRegistering ${_registrationScreenStore.isRegistering}");
                                  },
                                ),
                              ],
                            );
                            if (!mounted) return;
                            Navigator.of(context).pushNamed(
                              OtpScreen.routeName,
                              arguments: {
                                "tag": "register_account",
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(),
                          child: _registrationScreenStore.isRegistering
                              ? MiniWidgets.circularProgressIndicatorOnButton()
                              : const Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: AppColors.black1,
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  text: "By lobby the button above, you agree to our",
                  style: TextStyle(
                    color: AppColors.grey2,
                  ),
                  children: [
                    TextSpan(text: "Terms of Service "),
                    TextSpan(text: "Terms of Service"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpDivider extends StatelessWidget {
  const SignUpDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.5,
        width: 20,
        decoration: const BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
