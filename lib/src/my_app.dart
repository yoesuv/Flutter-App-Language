import 'package:app_language/src/blocs/app_bloc.dart';
import 'package:app_language/src/events/app_event.dart';
import 'package:app_language/src/routes/app_route.dart';
import 'package:app_language/src/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..add(AppInitEvent()),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
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
            onGenerateRoute: AppRoute.routes,
          );
        },
      ),
    );
  }
}
