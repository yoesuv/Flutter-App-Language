import 'package:app_language/src/core/data/constants.dart';
import 'package:app_language/src/my_app_event.dart';
import 'package:app_language/src/my_app_state.dart';
import 'package:app_language/src/utils/extension_locale.dart';
import 'package:app_language/src/utils/preference_util.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(const MyAppState()) {
    on<MyAppInitEvent>(_onAppInit);
    on<MyAppChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onAppInit(
    MyAppInitEvent event,
    Emitter<MyAppState> emit,
  ) async {
    final settingLanguage = await PreferenceUtil.getString(appLanguage);
    final settingLocale = Locale(settingLanguage ?? 'en');
    emit(state.copyWith(
      locale: settingLocale,
      strLanguage: settingLocale.fullName(),
    ));
  }

  void _onChangeLanguage(
    MyAppChangeLanguageEvent event,
    Emitter<MyAppState> emit,
  ) {
    PreferenceUtil.setString(appLanguage, event.languageCode);
    final settingLocale = Locale(event.languageCode);
    emit(state.copyWith(
      locale: settingLocale,
      strLanguage: settingLocale.fullName(),
    ));
  }
}
