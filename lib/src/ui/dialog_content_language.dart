import 'package:app_language/src/utils/extension_locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DialogContentLanguage extends StatelessWidget {
  final Function(String languageCode) onTap;
  const DialogContentLanguage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: context.supportedLocales.length,
        itemBuilder: (context, index) {
          final locals = context.supportedLocales;
          return InkWell(
            onTap: () {
              onTap(locals[index].languageCode);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(locals[index].fullName()),
            ),
          );
        },
      ),
    );
  }
}
