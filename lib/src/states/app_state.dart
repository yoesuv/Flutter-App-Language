import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  final Locale locale;
  const AppState({required this.locale});

  AppState copyWith({Locale? locale}) =>
      AppState(locale: locale ?? this.locale);

  @override
  List<Object?> get props => [locale];
}
