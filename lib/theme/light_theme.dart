
import 'package:flutter/material.dart';
ThemeData light = ThemeData(
  fontFamily: 'Lato',
  primaryColor: const Color(0xffB89018),
  brightness: Brightness.light,
  focusColor: const Color(0xFFADC4C8),
  hintColor: const Color(0xFF52575C),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);