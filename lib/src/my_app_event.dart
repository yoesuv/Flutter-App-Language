import 'package:equatable/equatable.dart';

abstract class MyAppEvent extends Equatable {}

class MyAppInitEvent extends MyAppEvent {
  @override
  List<Object?> get props => [];
}

class MyAppChangeLanguageEvent extends MyAppEvent {
  final String languageCode;
  MyAppChangeLanguageEvent({required this.languageCode});
  @override
  List<Object?> get props => [languageCode];
}
