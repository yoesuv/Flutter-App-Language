import 'package:app_language/src/my_app_bloc.dart';
import 'package:app_language/src/my_app_event.dart';
import 'package:app_language/src/core/routes/app_route.dart';
import 'package:app_language/src/my_app_state.dart';
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
        BlocProvider<MyAppBloc>(
          create: (context) => MyAppBloc()..add(MyAppInitEvent()),
        ),
      ],
      child: BlocBuilder<MyAppBloc, MyAppState>(
        buildWhen: (prev, current) => prev.locale != current.locale,
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
              useMaterial3: false,
            ),
            onGenerateRoute: AppRoute.routes,
          );
        },
      ),
    );
  }
}
