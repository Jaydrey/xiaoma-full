import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/mixins/mixins.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class SetPassWordScreen extends StatefulWidget {
  const SetPassWordScreen({super.key});
  static const routeName = "/set-password-screen";

  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

class _SetPassWordScreenState extends State<SetPassWordScreen>
    with ValidationMixins {
  // stores
  final SetPasswordStore _setPasswordStore = locator<SetPasswordStore>();
  // keys
  final _formKey = GlobalKey<FormState>();

  // states
  bool _isLoading = false;

  // functions
  Future<void> _testFunction({required BuildContext? funcContext}) async {
    if (FocusScope.of(funcContext!).hasFocus) {
      FocusScope.of(funcContext).unfocus();
    }
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    _formKey.currentState?.save();
    if (_setPasswordStore.isCorrectPassword == false) {
      return;
    }
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
    Navigator.of(funcContext).pushNamed(LoginScreen.routeName);
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
            children: [
              SizedBox(
                height: _size.height * .1,
              ),
              const Center(
                child: Text(
                  "Set a new password",
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
                  AppConstants.AUTH_FORGOT_PASSWORD2,
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
                    const Text(
                      "Enter Password",
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
                          showPassword: _setPasswordStore.showPassword,
                          prefixIcon: const Icon(
                            CupertinoIcons.padlock,
                            color: AppColors.grey3,
                          ),
                          hintText: "Enter Password",
                          suffixIcon: _setPasswordStore.showPassword
                              ? IconButton(
                                  onPressed: () {
                                    _setPasswordStore.handleShowPassword();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: AppColors.grey3,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    _setPasswordStore.handleShowPassword();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye,
                                    color: AppColors.grey3,
                                  ),
                                ),
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                            _setPasswordStore.password = newValue.trim();
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
                          showPassword: _setPasswordStore.showConfirmPassword,
                          prefixIcon: const Icon(
                            CupertinoIcons.padlock,
                            color: AppColors.grey3,
                          ),
                          hintText: "Confirm Password",
                          suffixIcon: _setPasswordStore.showConfirmPassword
                              ? IconButton(
                                  onPressed: () {
                                    _setPasswordStore
                                        .handleShowConfirmPassword();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: AppColors.grey3,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    _setPasswordStore
                                        .handleShowConfirmPassword();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye,
                                    color: AppColors.grey3,
                                  ),
                                ),
                          onSaved: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return;
                            }
                            _setPasswordStore.confirmPassword = newValue.trim();
                          },
                          validator: validatePassword,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: _size.height * .07),
              CustomElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        _testFunction(funcContext: context);
                      },
                child: _isLoading
                    ? MiniWidgets.circularProgressIndicatorOnButton()
                    : const Text(
                        "Save and Continue",
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
