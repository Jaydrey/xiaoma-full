import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/app/themes/themes.dart';

import 'package:xiaoma/onboarding/onboarding.dart';
import 'package:xiaoma/utils/locator.dart';
import 'package:xiaoma/widgets/widgets.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  static const routeName = "/onboarding-screen";

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  // repo
  final _sharedPreferences = locator<SharedPreferencesRepo>();
  // controllers
  final PageController _controller = PageController(initialPage: 0);

  // index
  int _pageIndex = 0;

  // function
  Future<void> _actionSaveOnBoardStatus() async {
    final _result = await _sharedPreferences.setOnBoardedStatus(value: true);
    print("result $_result");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _xialuSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _pageIndex != 2
                      ? [
                          const Text(
                            'SKIP',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.primaryColor,
                            size: 19,
                          ),
                        ]
                      : [],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: onboardContentList.length,
                  itemBuilder: (context, index) {
                    final item = onboardContentList[index];
                    return Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          item.image,
                        ),
                        const Spacer(),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            color: AppColors.black1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onboardContentList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DotsIndicator(
                        isActive: index == _pageIndex,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.grey1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_pageIndex != 2) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        await _actionSaveOnBoardStatus();
                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      _pageIndex != 2 ? 'Next' : 'Get Started',
                      style: const TextStyle(
                        color: AppColors.black1,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
