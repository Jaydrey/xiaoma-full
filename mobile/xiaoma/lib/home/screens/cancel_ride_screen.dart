import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/home/home.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class CancelRideScreen extends StatefulWidget {
  const CancelRideScreen({super.key});
  static const routeName = "/cancel-ride-screen";

  @override
  State<CancelRideScreen> createState() => _CancelRideScreenState();
}

class _CancelRideScreenState extends State<CancelRideScreen> {
  // stores
  final _cancelRideStore = locator<CancelRideStore>();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Cancel Ride"),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: AppConstants.XIAMA_SCREEN_PADDING,
          right: AppConstants.XIAMA_SCREEN_PADDING,
        ),
        color: AppColors.backgroundColor,
        // alignment: Alignment.center,
        height: _size.height,
        constraints: BoxConstraints(
          minHeight: _size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please tell us why you want to cancel",
              style: TextStyle(
                color: AppColors.grey3,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ...cancelRideText.map(
              (text) {
                final value = cancelRideText.indexOf(text);
                return InkWell(
                  onTap: () {
                    _cancelRideStore.changeCancelRideReasons(
                      reasonLabel: text,
                      reasonIndex: value,
                    );
                    setState(() {});
                  },
                  child: Ink(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _cancelRideStore.isReason(reasonLabel: text)
                                ? AppColors.primaryColor
                                : AppColors.white,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: _cancelRideStore.isReason(reasonLabel: text)
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
            SizedBox(height: _size.height * .2),
            const Text(
              "Other Reason",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "Enter your reason",
              fill: true,
              fillColor: AppColors.grey1.withAlpha(100),
              hasBorder: false,
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 700));
                if (!mounted) return;
                orderRideDialog(
                  context: context,
                  size: _size,
                  actionNotNow: () async {
                    await Future.delayed(const Duration(milliseconds: 700));
                    if (!mounted) return;
                    Navigator.of(context).pop();
                    await Future.delayed(const Duration(milliseconds: 400));
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  },
                  actionAnotherRide: () async {
                    await Future.delayed(const Duration(milliseconds: 700));
                    if (!mounted) return;
                    Navigator.of(context).pop();
                    await Future.delayed(const Duration(milliseconds: 400));
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text(
                "Proceed",
                style: TextStyle(
                  color: AppColors.black1,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
