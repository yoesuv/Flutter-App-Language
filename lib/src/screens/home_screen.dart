import 'package:app_language/src/blocs/app_bloc.dart';
import 'package:app_language/src/events/app_event.dart';
import 'package:app_language/src/screens/dialog_content_laguage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late AppBloc? _appBloc;

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.change_language ?? ''),
        content: DialogContentLanguage(
          onTap: (String languageCode) {
            Navigator.of(context).pop();
            _appBloc?.add(AppChangeLanguageEvent(languageCode: languageCode));
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _appBloc = context.read<AppBloc>();
  }

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
                    onPressed: () {
                      _openDialog(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)?.change_language ?? '',
                    ),
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
