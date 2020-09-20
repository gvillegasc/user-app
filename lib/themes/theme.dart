import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTheme = ThemeData(
  primaryColor: Color(0xffFEDD7C),
  accentColor: Color(0xffFFFFFF),
  cursorColor: Color(0xffFEDD7C),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  textTheme: GoogleFonts.montserratTextTheme(),
);
