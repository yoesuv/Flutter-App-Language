import 'package:app_language/src/blocs/app_bloc.dart';
import 'package:app_language/src/events/app_event.dart';
import 'package:app_language/src/screens/home_screen.dart';
import 'package:app_language/src/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late AppBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AppBloc();
    _bloc?.add(AppInitEvent(locale: const Locale('en')));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _bloc,
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter App Language',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.locale,
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
