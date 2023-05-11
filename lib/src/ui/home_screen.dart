import 'package:app_language/src/my_app_bloc.dart';
import 'package:app_language/src/my_app_event.dart';
import 'package:app_language/src/ui/dialog_content_laguage.dart';
import 'package:app_language/src/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MyAppBloc? _appBloc;

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.change_language ?? ''),
        content: DialogContentLanguage(
          onTap: (String languageCode) {
            Navigator.of(context).pop();
            _appBloc?.add(MyAppChangeLanguageEvent(languageCode: languageCode));
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _appBloc = context.read<MyAppBloc>();
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
                  BlocBuilder<MyAppBloc, MyAppState>(builder: (context, state) {
                    return Text(state.strLanguage ?? '');
                  }),
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
