import 'package:app_language/src/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("id")],
      path: "assets/translations",
      fallbackLocale: const Locale("id"),
      child: const MyApp(),
    ),
  );
}
