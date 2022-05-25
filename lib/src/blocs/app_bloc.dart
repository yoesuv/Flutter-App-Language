import 'dart:ui';

import 'package:app_language/src/events/app_event.dart';
import 'package:app_language/src/states/app_state.dart';
import 'package:bloc/bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(locale: Locale('en'))) {
    on<AppInitEvent>(_onAppInit);
    on<AppChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onAppInit(AppInitEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(
      locale: event.locale,
    ));
  }

  void _onChangeLanguage(AppChangeLanguageEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(
      locale: Locale(event.languageCode),
    ));
  }
}
