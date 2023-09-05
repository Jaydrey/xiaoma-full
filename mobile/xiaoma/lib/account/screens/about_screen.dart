import 'package:flutter/material.dart';
import 'package:xiaoma/app/app.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  static const routeName = "/about-screen";

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // functions
  void _actionAboutBack() {
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _actionLegalScreen() {}

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _actionAboutBack,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("About"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        height: _size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            GestureDetector(
              onTap: _actionLegalScreen,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.description,
                    color: AppColors.green1,
                    size: 28,
                  ),
                ),
                title: Text(
                  "Legal Notice",
                  style: _theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _actionLegalScreen,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star,
                    color: AppColors.green1,
                    size: 28,
                  ),
                ),
                title: Text(
                  "Rate XiaoMa",
                  style: _theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Version 1.0.0",
                style: _theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
