import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class AppInitEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

class AppChangeLanguageEvent extends AppEvent {
  final String languageCode;
  AppChangeLanguageEvent({required this.languageCode});
  @override
  List<Object?> get props => [languageCode];
}
