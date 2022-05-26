import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  final Locale? locale;
  final String? strLanguage;
  const AppState({this.locale, this.strLanguage});

  AppState copyWith({Locale? locale, String? strLanguage}) => AppState(
        locale: locale ?? this.locale,
        strLanguage: strLanguage ?? this.strLanguage,
      );

  @override
  List<Object?> get props => [locale, strLanguage];
}
