import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/app/themes/themes.dart';

class CustomToast {
  static void showToast({
    required BuildContext? context,
    required String? message,
    bool? success = false,
  }) {
    final _size = MediaQuery.of(context!).size;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: _size.height * .06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: success == true
                    ? AppColors.primaryColor
                    : AppColors.errorColor,
              ),
              child: Row(
                children: [
                  SizedBox(width: _size.width * .07),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          message ?? "",
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -5,
              left: 10,
              child: Image.asset(
                success == true
                    ? AppConstants.TOAST_CHECK_SVG
                    : AppConstants.TOAST_FAIL_SVG,
                height: 20,
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  AppConstants.TOAST_BUBBLE_SVG,
                  height: 28,
                  width: 20,
                  color: success == true ? AppColors.green1 : AppColors.red1,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
