import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/core/app_colors.dart';

final myTheme = ThemeData(
  primaryColor: AppColors.yellow50,
  accentColor: AppColors.white50,
  cursorColor: AppColors.yellow50,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  textTheme: GoogleFonts.montserratTextTheme(),
);
