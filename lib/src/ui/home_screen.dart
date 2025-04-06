import 'package:app_language/src/ui/dialog_content_laguage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("change_language".tr()),
            content: DialogContentLanguage(
              onTap: (String languageCode) {
                Navigator.of(context).pop();
                context.setLocale(Locale(languageCode));
              },
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("app_name".tr())),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "app_language_info".tr(),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              Text(
                "settings".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Divider(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "current_language".tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _openDialog(context);
                    },
                    child: Text("change_language".tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
