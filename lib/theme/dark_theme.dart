import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Lato',
  primaryColor: const Color(0xffFDDA72),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  hintColor: const Color(0xFFE7F6F8),
  focusColor: const Color(0xFFADC4C8),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
