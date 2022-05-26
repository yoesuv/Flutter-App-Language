import 'package:flutter/material.dart';

extension FullName on Locale {
  String fullName() {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'id':
        return 'Indonesia';
      default:
        return '';
    }
  }
}
