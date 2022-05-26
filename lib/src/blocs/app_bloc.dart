import 'package:app_language/src/data/constants.dart';
import 'package:app_language/src/events/app_event.dart';
import 'package:app_language/src/states/app_state.dart';
import 'package:app_language/src/utils/preference_util.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitEvent>(_onAppInit);
    on<AppChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onAppInit(
    AppInitEvent event,
    Emitter<AppState> emit,
  ) async {
    final settingLanguage = await PreferenceUtil.getString(appLanguage);
    emit(state.copyWith(
      locale: Locale(settingLanguage ?? 'en'),
    ));
  }

  void _onChangeLanguage(
    AppChangeLanguageEvent event,
    Emitter<AppState> emit,
  ) {
    PreferenceUtil.setString(appLanguage, event.languageCode);
    emit(state.copyWith(
      locale: Locale(event.languageCode),
    ));
  }
}
