import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyAppState extends Equatable {
  final Locale? locale;
  final String? strLanguage;

  const MyAppState({
    this.locale,
    this.strLanguage,
  });

  MyAppState copyWith({
    Locale? locale,
    String? strLanguage,
  }) =>
      MyAppState(
        locale: locale ?? this.locale,
        strLanguage: strLanguage ?? this.strLanguage,
      );

  @override
  List<Object?> get props => [
        locale,
        strLanguage,
      ];
}
