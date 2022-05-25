import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.app_name ?? ''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)?.app_language_info ?? '',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)?.settings ?? '',
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
                    AppLocalizations.of(context)?.settings ?? '',
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        AppLocalizations.of(context)?.change_language ?? ''),
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
