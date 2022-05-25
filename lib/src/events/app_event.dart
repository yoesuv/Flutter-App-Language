import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppEvent extends Equatable {}

class AppInitEvent extends AppEvent {
  final Locale locale;
  AppInitEvent({required this.locale});
  @override
  List<Object?> get props => [locale];
}

class AppChangeLanguageEvent extends AppEvent {
  final String languageCode;
  AppChangeLanguageEvent({required this.languageCode});
  @override
  List<Object?> get props => [languageCode];
}
