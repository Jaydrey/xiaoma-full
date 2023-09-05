import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiaoma/app/constants/constants.dart';
import 'package:xiaoma/profile/profile.dart';
import 'package:xiaoma/app/themes/themes.dart';
import 'package:xiaoma/utils/utils.dart';
import 'package:xiaoma/widgets/widgets.dart';

class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});
  static const routeName = "/promo-code-screen";

  @override
  State<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  // stores
  final _promocodeStore = locator<PromoCodeStore>();

  // functions
  void _leadingPressed() {
    Navigator.of(context)
        .pop(_promocodeStore.currentCodeIndex != null ? "TYPANGH" : null);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pop(_promocodeStore.currentCodeIndex != null ? "TYPANGH" : null);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _leadingPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: Text(
            _promocodeStore.screenTitle.getScreenTitle(),
          ),
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
            children: [
              ...List.generate(
                4,
                (index) => Observer(
                  builder: (_) {
                    return PromoCodeCard(
                      onTap: () {
                        _promocodeStore.changeCurrentCodeIndex(value: index);
                        setState(() {});
                      },
                      cardColor: _promocodeStore.currentCodeIndex == index
                          ? AppColors.primaryColor
                          : null,
                    );
                  },
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    _promocodeStore.currentCodeIndex != null ? "TYPANGH" : null,
                  );
                },
                child: Text(
                  "Apply Promo",
                  style: _theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black1,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
