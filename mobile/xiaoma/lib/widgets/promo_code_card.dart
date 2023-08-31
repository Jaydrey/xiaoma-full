// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:xiaoma/app/themes/themes.dart';

class PromoCodeCard extends StatefulWidget {
  final VoidCallback onTap;
  final Color? cardColor;
  const PromoCodeCard({
    super.key,
    this.cardColor,
    required this.onTap,
  });

  @override
  State<PromoCodeCard> createState() => _PromoCodeCardState();
}

class _PromoCodeCardState extends State<PromoCodeCard> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/promo_code.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special 25% Off",
                    style: _theme.textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Special promo only today",
                    style: _theme.textTheme.displaySmall?.copyWith(
                      fontSize: 16,
                      color: AppColors.grey3,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: widget.onTap,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: AppColors.primaryColor,
                      style: BorderStyle.solid,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: AppColors.white,
                        style: BorderStyle.solid,
                      ),
                      color: widget.cardColor ?? AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
