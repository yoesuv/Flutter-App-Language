import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogContentLanguage extends StatelessWidget {
  final Function()? onTap;
  const DialogContentLanguage({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AppLocalizations.supportedLocales.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                AppLocalizations.supportedLocales[index].languageCode,
              ),
            ),
          );
        },
      ),
    );
  }
}
