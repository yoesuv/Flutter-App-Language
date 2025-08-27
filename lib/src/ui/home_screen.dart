import 'package:app_language/src/ui/dialog_content_laguage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr("change_language")),
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
      appBar: AppBar(title: Text(context.tr("app_name"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr("app_language_info"),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              Text(
                context.tr("settings"),
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
                    context.tr("current_language"),
                    style: const TextStyle(fontSize: 14),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _openDialog(context);
                    },
                    child: Text(context.tr("change_language")),
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
